from tensorflow.keras.models import load_model
import pickle
from tensorflow.keras.preprocessing.sequence import pad_sequences
import numpy as np

# Load model and tools
model = load_model("lstm_course_recommendation_model.h5")
tokenizer = pickle.load(open("tokenizer.pkl", "rb"))
label_encoder = pickle.load(open("label_encoder.pkl", "rb"))

# Predict function
def recommend_course(review_text):
    sequence = tokenizer.texts_to_sequences([review_text])
    padded = pad_sequences(sequence, maxlen=100)
    prediction = model.predict(padded)
    class_index = np.argmax(prediction)
    return label_encoder.inverse_transform([class_index])[0]

# Test it
review = "Very detailed and hands-on course, I learned a lot"
print("Recommended Course:", recommend_course(review))
