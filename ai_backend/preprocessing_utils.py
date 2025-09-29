import pandas as pd
from sklearn.base import BaseEstimator, TransformerMixin

class DFColumnTransformerWrapper(BaseEstimator, TransformerMixin):
    def __init__(self, ct, prefix="feat"):
        self.ct = ct
        self.prefix = prefix

    def fit(self, X, y=None):
        self.ct.fit(X, y)
        return self

    def transform(self, X):
        arr = self.ct.transform(X)
        try:
            # Use the built-in method to get feature names
            names = self.ct.get_feature_names_out()
        except Exception:
            # Fallback for older versions or complex cases
            names = [f"{self.prefix}_{i}" for i in range(arr.shape[1])]
        return pd.DataFrame(arr, columns=names, index=X.index)