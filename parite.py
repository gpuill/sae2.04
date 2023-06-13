import numpy as np
import pandas as pd

pariteDF=pd.read_csv("parite_vue_sae.csv")

pariteDF=pariteDF.dropna()
pariteAR=pariteDF.to_numpy()