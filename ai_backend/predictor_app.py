import pandas as pd
import numpy as np
import joblib
import shap
import matplotlib

matplotlib.use('Agg')
import matplotlib.pyplot as plt
import io
import base64

try:
    PIPELINE = joblib.load("models/diabetes_prediction_pipeline.joblib")
    TRAINING_COLS = joblib.load("models/training_columns.joblib")
    print("Pipeline and training columns loaded successfully.")
except Exception as e:
    print(f"FATAL ERROR: Could not load the model or columns: {e}")
    PIPELINE = None
    TRAINING_COLS = None

def analyze_risk_factors(user_input):
    explanations = []
    glucose = user_input.get('LBXGLU')
    if glucose:
        if glucose >= 126: explanations.append(f"Fasting glucose ({glucose} mg/dL) is in the diabetic range (≥126 mg/dL).")
        elif glucose >= 100: explanations.append(f"Fasting glucose ({glucose} mg/dL) is in the prediabetic range (100-125 mg/dL).")
    sbp = user_input.get('BPXSY1')
    dbp = user_input.get('BPXDI1')
    if sbp and dbp:
        if sbp >= 140 or dbp >= 90: explanations.append(f"Blood pressure ({sbp}/{dbp} mmHg) indicates Stage 2 Hypertension.")
        elif sbp >= 130 or dbp >= 80: explanations.append(f"Blood pressure ({sbp}/{dbp} mmHg) indicates Stage 1 Hypertension.")
    bmi = user_input.get('BMXBMI')
    if bmi:
        if bmi >= 30: explanations.append(f"BMI ({bmi:.1f}) is in the obese range (≥30).")
        elif bmi >= 25: explanations.append(f"BMI ({bmi:.1f}) is in the overweight range (25-29.9).")
    if not explanations: explanations.append("Key risk factors appear to be within normal ranges.")
    return explanations

def get_severity_level(probability):
    if probability < 0.35: return "Low Risk"
    if probability < 0.70: return "Moderate Risk"
    return "High Risk"

def get_shap_plot_base64(full_df):
    try:
        print("Attempting to generate SHAP plot...")
        preprocessor = PIPELINE.named_steps['preprocessor']
        classifier = PIPELINE.named_steps['classifier']
        transformed_instance = preprocessor.transform(full_df)

        feature_names_out = preprocessor.get_feature_names_out()

        transformed_instance_df = pd.DataFrame(transformed_instance, columns=feature_names_out)
        explainer = shap.TreeExplainer(classifier)
        shap_values = explainer.shap_values(transformed_instance_df)
        
        shap_explanation = shap.Explanation(
            values=shap_values[0], 
            base_values=explainer.expected_value[1],
            data=transformed_instance_df.iloc[0],
            feature_names=feature_names_out
        )

        # Generate the plot
        plt.figure()
        shap.plots.waterfall(shap_explanation, show=False)
        plt.tight_layout()

        buf = io.BytesIO()
        plt.savefig(buf, format="png")
        plt.close()
        buf.seek(0)
        
        image_base64 = base64.b64encode(buf.getvalue()).decode("utf-8")
        print("SHAP plot generated successfully.")
        return image_base64

    except Exception as e:
        print(f"!!! CRITICAL ERROR generating SHAP plot: {e}")
        import traceback
        traceback.print_exc()
        return None

# Main Prediction function
def run_prediction_flow(user_input_data):
    if PIPELINE is None or TRAINING_COLS is None:
        return {"error": "Model is not loaded. Cannot make a prediction."}

    print("--- DEBUGGING INFO ---")
    print(f"1. Data received from app: {user_input_data}")
    
    full_df = pd.DataFrame(user_input_data, index=[0])[TRAINING_COLS]
    
    print(f"3. DataFrame being sent to model:\n{full_df.to_string()}")

    # --- Predictions ---
    prediction = int(PIPELINE.predict(full_df)[0])
    probability = float(PIPELINE.predict_proba(full_df)[:, 1][0])
    
    # --- Analysis and Visuals ---
    severity = get_severity_level(probability)
    explanation_text = analyze_risk_factors(user_input_data)
    shap_plot_base64 = get_shap_plot_base64(full_df)

    results = {
        "prediction": prediction,
        "probability": round(probability, 4),
        "severity": severity,
        "explanation_text": explanation_text,
        "shap_plot_bytes": shap_plot_base64,
    }
    
    print(f"4. Prediction results: {results['severity']} (Prediction: {results['prediction']}, Probability: {results['probability']})")
    print("--- END OF DEBUG ---")
    return results

