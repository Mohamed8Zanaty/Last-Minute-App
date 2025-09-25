import pandas as pd
import numpy as np
import joblib
import shap
import matplotlib.pyplot as plt
import io
import base64

# Loadong Models and Columns 
try:
    PIPELINE = joblib.load("models/diabetes_prediction_pipeline.joblib")
    TRAINING_COLS = joblib.load("models/training_columns.joblib")
    print("Pipeline and training are done.")
except Exception as e:
    print(f"Error loading the models: {e}")
    PIPELINE = None
    TRAINING_COLS = None

# Clinical Guidelines Based Explanation
def analyze_risk_factors(user_input):
    "we need to contact a medical expert to validate these rules and these guidelines are from an online research specially NHANES"
    explanations = []
    
    # 1. Analyze Glucose (based on American Diabetes Association guidelines)
    glucose = user_input.get('LBXGLU')
    if glucose:
        if glucose >= 126:
            explanations.append(f"Fasting glucose ({glucose} mg/dL) is in the diabetic range (≥126 mg/dL).")
        elif glucose >= 100:
            explanations.append(f"Fasting glucose ({glucose} mg/dL) is in the prediabetic range (100-125 mg/dL).")

    # 2. Analyze Blood Pressure (based on ACC/AHA guidelines)
    sbp = user_input.get('BPXSY1')
    dbp = user_input.get('BPXDI1')
    if sbp and dbp:
        if sbp >= 140 or dbp >= 90:
            explanations.append(f"Blood pressure ({sbp}/{dbp} mmHg) indicates Stage 2 Hypertension (≥140/90 mmHg).")
        elif sbp >= 130 or dbp >= 80:
            explanations.append(f"Blood pressure ({sbp}/{dbp} mmHg) indicates Stage 1 Hypertension (≥130/80 mmHg).")
        elif sbp >= 120:
            explanations.append(f"Blood pressure ({sbp}/{dbp} mmHg) is elevated.")

    # 3. Analyze BMI (based on WHO categories)
    bmi = user_input.get('BMXBMI')
    if bmi:
        if bmi >= 40:
            explanations.append(f"BMI ({bmi:.1f}) is in the Obesity Class III range (≥40).")
        elif bmi >= 35:
            explanations.append(f"BMI ({bmi:.1f}) is in the Obesity Class II range (35-39.9).")
        elif bmi >= 30:
            explanations.append(f"BMI ({bmi:.1f}) is in the Obesity Class I range (30-34.9).")
        elif bmi >= 25:
            explanations.append(f"BMI ({bmi:.1f}) is in the overweight range (25-29.9).")

    if not explanations:
        explanations.append("Key risk factors are within normal ranges.")
        
    return explanations
# Severity Level based on Probability
def get_severity_level(probability):
    if probability < 0.35: return "Low Risk"
    if probability < 0.70: return "High Risk"
    return "Critical Risk"

def get_shap_plot_base64(full_df):
    preprocessor = PIPELINE.named_steps['preprocessor']
    model = PIPELINE.named_steps['model']
    transformed_instance = preprocessor.transform(full_df)
    transformed_columns = preprocessor.ct.get_feature_names_out()
    transformed_instance_df = pd.DataFrame(transformed_instance, columns=transformed_columns, index=full_df.index)
    
    explainer = shap.TreeExplainer(model)
    shap_values = explainer.shap_values(transformed_instance_df)
    
    plt.figure()
    shap.plots.waterfall(shap.Explanation(values=shap_values[0], base_values=explainer.expected_value, data=transformed_instance_df.iloc[0]), show=False)
    plt.tight_layout()
    
    buf = io.BytesIO()
    plt.savefig(buf, format="png")
    plt.close()
    image_base64 = base64.b64encode(buf.getvalue()).decode("utf-8")
    buf.close()
    return image_base64

# Main Prediction function
def run_prediction_flow(user_input_data):
    if PIPELINE is None:
        return {"error": "Model not loaded."}

    # Create the full DataFrame for --> pipeline
    full_df = pd.DataFrame(columns=TRAINING_COLS)
    full_df.loc[0] = np.nan
    for col, value in user_input_data.items():
        if col in full_df.columns:
            full_df.loc[0, col] = value
            
    # Fetching Results
    probability = PIPELINE.predict_proba(full_df)[:, 1][0]
    severity = get_severity_level(probability)
    explanation_text = analyze_risk_factors(user_input_data)
    shap_plot_base64 = get_shap_plot_base64(full_df)
    
    return {
        "probability": probability,
        "severity": severity,
        "explanation_text": explanation_text,
        "shap_plot_base64": shap_plot_base64
    }