# Learning and Estimation of Dynamical Systems – ARX & FIR Model Identification

## 📌 Project Overview

This MATLAB project focuses on the identification and validation of discrete-time linear models for dynamical systems using **Least Squares (LS)** methods. Two classes of models are considered:

- **ARX (Auto-Regressive with eXogenous input)** models
- **FIR (Finite Impulse Response)** models

The project includes:
- Model estimation using LS
- Model validation via cross-validation and prediction
- Complexity selection using statistical criteria (FPE, AIC, MDL)
- Comparison between different model structures

---

## 📁 Project Structure

```
├── data/
│   └── dataset.mat              # Contains input-output data (u, y)
├── functions/
│   ├── build_regressor.m        # Builds the regressor matrix Φ for ARX/FIR
│   ├── least_squares.m          # Performs LS estimation of θ
│   ├── compute_criteria.m       # Computes FPE, AIC, MDL for complexity selection
│   ├── predict_output.m         # Predicts output using identified model
│   └── plot_results.m           # Helper function for plotting results
├── main.m                       # Main script for model estimation and validation
├── README.md                    # This file
```

---

## 📊 Model Structures

### 🔹 ARX Model

The ARX model of order (na, nb) is given by:

```
y(t) + a₁·y(t−1) + ... + aₙa·y(t−na) = b₁·u(t−1) + ... + bₙb·u(t−nb)
```

Rewritten for LS:

```
y(t) = −a₁·y(t−1) − ... − aₙa·y(t−na) + b₁·u(t−1) + ... + bₙb·u(t−nb) + e(t)
```

### 🔹 FIR Model

The FIR model of order nb is a special case of the ARX with no dependence on past outputs:

```
y(t) = b₁·u(t−1) + ... + bₙb·u(t−nb) + e(t)
```

---

## 🚀 How to Run

1. Open MATLAB.
2. Navigate to the project folder.
3. Load the dataset:
   ```matlab
   load('data/dataset.mat') % Contains u (input), y (output)
   ```
4. Run the main script:
   ```matlab
   run main.m
   ```

The script will:
- Estimate ARX and FIR models with increasing order
- Predict outputs
- Plot errors and performance
- Compute FPE, AIC, MDL
- Recommend the best model order

---

## 📈 Complexity Selection

The project uses the following criteria to select optimal model complexity:

- **FPE**: Final Prediction Error
- **AIC**: Akaike Information Criterion
- **MDL**: Minimum Description Length

These are computed as a function of model order, and the model with the minimum criterion is selected.

---

## ✅ Model Validation

- **Cross-Validation**: Split data into training and validation sets.
- **Prediction**: Use estimated parameters to predict output on validation set.
- **MSE Calculation**: Evaluate Mean Squared Error between predicted and real outputs.

---

## 🛠️ Dependencies

- MATLAB R2021a or later
- No external toolboxes required

---

## 📚 References

- Course notes – Learning and Estimation of Dynamical Systems

---

## 👨‍💻 Author

Nicholas Gioia – Università di Bologna
Course: Learning and Estimation of Dynamical Systems  
Academic Year: 2023/2024
