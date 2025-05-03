# ❤️ Cardiac Function Assessment - Flutter + Deep Learning + Computer Vision

A cross-platform mobile app powered by **Flutter** and **FastAPI**, designed to analyze echocardiogram videos and estimate **Left Ventricular Ejection Fraction (LVEF)** using Deep Learning models. This tool aids in early detection of heart dysfunction, particularly cardiomyopathy and heart failure risks.

> 🏆 This project was presented at **Benha University’s Innovations Marathon**.

---

## 📌 Problem Definition

The **left ventricle** plays a crucial role in pumping oxygenated blood to the body. Dysfunction of this chamber, often caused by **cardiomyopathy**, can lead to severe consequences such as **heart failure** or **cardiac arrest**.
**LVEF (Left Ventricular Ejection Fraction)** is a key clinical metric used to assess the heart’s performance. An accurate estimation of LVEF is critical in early diagnosis and treatment planning.

---

## 🎯 Objective

Build an end-to-end system that:

* Automatically processes echocardiogram videos.
* Segments the left ventricle using deep learning.
* Predicts the LVEF value.
* Determines whether the cardiac function is **normal or abnormal**.
* Offers a user-friendly mobile interface for video upload and results display.

---

## 🦱 Tech Stack

### 📱 Frontend (Mobile)

* **Flutter** (Dart)
* Clean Architecture
* Modern UI/UX with custom screens

### 🧪 Backend

* **FastAPI** (Python)
* Deep Learning Models:

  * `TransformerModel.pt` — LVEF regression model
  * `ES_Unet.weights.h5` — End-systolic segmentation
  * `ED_Unet.weights.h5` — End-diastolic segmentation
* **OpenCV**, **NumPy**, **Keras**, **PyTorch**

---

## 📱 Screenshots

All screenshots are stored inside the folder: `Demo of The Mobile App`

| Splash Screen                                           | Register Screen                                           | Login Screen                                           |
| ------------------------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------ |
| ![](Demo%20of%20The%20Mobile%20App/Splash%20Screen.png) | ![](Demo%20of%20The%20Mobile%20App/Register%20Screen.png) | ![](Demo%20of%20The%20Mobile%20App/Login%20Screen.png) |

| Upload Video                                                    | Selected Video                                           | Picking a Video                                             |
| --------------------------------------------------------------- | -------------------------------------------------------- | ----------------------------------------------------------- |
| ![](Demo%20of%20The%20Mobile%20App/Upload%20Video%20Screen.png) | ![](Demo%20of%20The%20Mobile%20App/Selected%20Video.png) | ![](Demo%20of%20The%20Mobile%20App/Picking%20a%20Video.png) |

| Processing Model                                                    | Results (Frames)                                         | Good Values                                                     |
| ------------------------------------------------------------------- | -------------------------------------------------------- | --------------------------------------------------------------- |
| ![](Demo%20of%20The%20Mobile%20App/Model%20Processing%20Screen.png) | ![](Demo%20of%20The%20Mobile%20App/Results%20Frames.png) | ![](Demo%20of%20The%20Mobile%20App/Results%20Good%20Values.png) |

| Bad Values                                                     |
| -------------------------------------------------------------- |
| ![](Demo%20of%20The%20Mobile%20App/Results%20Bad%20Values.png) |

---

## 🚀 Getting Started

Follow these steps to set up both the backend and mobile app:

### 1⃣ Clone the Repository

```bash
git clone https://github.com/kirlousHelal/Cardic-Function-Assement-GP---Flutter-DeepLearning_Computer_Vision-.git
cd Cardic-Function-Assement-GP---Flutter-DeepLearning_Computer_Vision-
```

---

### 2⃣ Backend Setup (FastAPI + Deep Learning)

> Navigate to the `FastAPI/` folder

#### 📅 Required Files

You must manually download the model files and place them inside the `FastAPI/` folder.

| Model              | Download Link                                                                              | Rename To             |
| ------------------ | ------------------------------------------------------------------------------------------ | --------------------- |
| Transformer (LVEF) | [best.pt](https://www.kaggle.com/code/abanoubgamal/transformermodel/output?select=best.pt) | `TransformerModel.pt` |
| ES U-Net           | [ES\_Best.weights.h5](https://www.kaggle.com/models/abanoubgamal/u-net/Keras/es)           | `ES_Unet.weights.h5`  |
| ED U-Net           | [ED\_U\_NET\_Model.weights.h5](https://www.kaggle.com/models/abanoubgamal/u-net/Keras/ed)  | `ED_Unet.weights.h5`  |

📂 Final structure:

```
FastAPI/
├── main.py
├── TransformerModel.pt
├── ES_Unet.weights.h5
└── ED_Unet.weights.h5
```

#### ▶️ Run the FastAPI Server

```bash
# (Optional) Create a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`

# Install dependencies
pip install -r requirements.txt

# Run the backend server
cd FastAPI
python main.py
```

By default, FastAPI runs on `http://127.0.0.1:8000`

---

### 3⃣ Flutter App Setup

#### 📦 Install dependencies

```bash
flutter pub get
```

#### ▶️ Run the app

```bash
flutter run
```

Make sure your emulator or device is connected.

---

## 🎮 Demo Video

* You can find a live demo video of the system here:
  🎥 `Demo of The Mobile App/Video_Demo.mp4`

---

## 📂 Project Structure

```
.
├── Demo of The Mobile App/      # Screenshots and demo video
├── FastAPI/                     # Backend server and ML models
├── lib/                         # Flutter app code
├── pubspec.yaml                 # Flutter config
├── requirements.txt             # Python dependencies
└── README.md                    # This file
```

---

## 📜 License

This project is for educational and research purposes. Please refer to the [LICENSE](./LICENSE) file (if added) for reuse or citation guidelines.

---

## 🤝 Acknowledgements

* Special thanks to **Benha University** for hosting the Innovations Marathon.
* Inspired by the clinical need for early detection of cardiac dysfunction.
