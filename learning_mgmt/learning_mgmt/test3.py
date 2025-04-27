import pandas as pd
import re
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from textblob import TextBlob
from keras.preprocessing.text import Tokenizer
from keras.preprocessing.sequence import pad_sequences

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

def extract_lexicon_features(text):
    blob = TextBlob(text)
    return pd.Series([blob.sentiment.polarity, blob.sentiment.subjectivity])

# Load dataset
data = pd.read_csv('static/dataset/course_recommend.csv')

# Preprocess reviews
data['Processed_Review'] = data['Review_Text'].apply(preprocess_text)

# Sentiment & rating
data['Sentiment'] = data['Processed_Review'].apply(detect_sentiment)
data['Estimated_Rating'] = data['Sentiment'].apply(estimate_rating)

# Lexicon features
data[['Polarity', 'Subjectivity']] = data['Processed_Review'].apply(extract_lexicon_features)

# Convert reviews to sequences (LSTM-ready)
tokenizer = Tokenizer(num_words=5000, oov_token='<OOV>')
tokenizer.fit_on_texts(data['Processed_Review'])
sequences = tokenizer.texts_to_sequences(data['Processed_Review'])
padded_sequences = pad_sequences(sequences, padding='post')

# Save padded sequences to CSV
padded_df = pd.DataFrame(padded_sequences)
padded_df.to_csv('lstm_ready_sequences.csv', index=False)
data.to_csv('processed_reviews2.csv', index=False)

print("Lexicon features and LSTM sequences extracted. Files saved: 'processed_reviews.csv', 'lstm_ready_sequences.csv'")
