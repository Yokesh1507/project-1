import pandas as pd
import re
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer

# Download necessary resources
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')

def preprocess_text(text):
    # Convert to lowercase
    text = text.lower()
    
    # Remove special characters and numbers
    text = re.sub(r'[^a-zA-Z\s]', '', text)
    
    # Tokenization
    tokens = word_tokenize(text)
    
    # Remove stopwords
    stop_words = set(stopwords.words('english'))
    tokens = [word for word in tokens if word not in stop_words]
    
    # Lemmatization
    lemmatizer = WordNetLemmatizer()
    tokens = [lemmatizer.lemmatize(word) for word in tokens]
    
    return ' '.join(tokens)

# Load dataset (Assuming CSV file with a 'Review_Text' column)
data = pd.read_csv('static/dataset/course_recommend.csv')

# Apply preprocessing
data['Processed_Review'] = data['Review_Text'].apply(preprocess_text)

# Save to new CSV file
data.to_csv('cleandata.csv', index=False)

print("Preprocessing complete. Processed data saved to 'cleandata.csv'.")
