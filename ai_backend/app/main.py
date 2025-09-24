#Comments for Mariammmmm
from fastapi import FastAPI
from pydantic import BaseModel
import pandas as pd

from app.predictor_app import run_prediction_flow
from core.preprocessing_utils import DFColumnTransformerWrapper # Keeping this is good practice

# Initialize the FastAPI app [api begins here]
app = FastAPI(
                title="SoCare Diabetes Prediction API",
                description="Provides diabetes risk prediction with clinical and model-based explanations."
            )

# Features we will take as input from the patient
class PatientData(BaseModel):
    RIDAGEYR: int
    RIAGENDR: int
    BMXBMI: float
    BPXSY1: float
    BPXDI1: float
    LBXGLU: float
    LBXIN: float
    LBXTR: float
    LBXHSCRP: float

# Define the API endpoint at /predict
@app.post("/predict")
def predict_diabetes(patient_data: PatientData):
    results = run_prediction_flow(patient_data.dict())
    return results

# Root endpoint for health check
@app.get("/")
def read_root():
    return {"status": "SoCare Prediction API is running."}