import pandas as pd
import re
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from textblob import TextBlob

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

def detect_sentiment(text):
    analysis = TextBlob(text)
    polarity = analysis.sentiment.polarity
    if polarity > 0.2:
        return 'Positive'
    elif polarity < -0.2:
        return 'Negative'
    else:
        return 'Neutral'

def estimate_rating(sentiment):
    if sentiment == 'Positive':
        return 4
    elif sentiment == 'Neutral':
        return 3
    else:
        return 1

# Load dataset (Assuming CSV file with a 'Review_Text' column)
data = pd.read_csv('static/dataset/course_recommend.csv')

# Apply preprocessing
data['Processed_Review'] = data['Review_Text'].apply(preprocess_text)

# Detect sentiment
data['Sentiment'] = data['Processed_Review'].apply(detect_sentiment)

# Estimate rating
data['Estimated_Rating'] = data['Sentiment'].apply(estimate_rating)

# Save to new CSV file
data.to_csv('processed_reviews.csv', index=False)

print("Preprocessing, sentiment analysis, and rating estimation complete. Saved to 'processed_reviews.csv'.")
