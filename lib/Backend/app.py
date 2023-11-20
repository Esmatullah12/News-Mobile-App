from flask import Flask, request, jsonify
import pickle

app = Flask(__name__)
model = pickle.load(open('./logistic_regression_model.joblib', 'rb'))

@app.route('/predict', methods=['POST'])
def predict():

  input_text = request.json['newsText']
  prediction = model.predict([input_text])[0]
  return jsonify({'prediction': prediction})

if __name__ == '__main__':
  app.run(debug=True)