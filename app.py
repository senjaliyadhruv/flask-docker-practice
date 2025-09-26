from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify(message='Hello from Flask app!', env='dev')

@app.route('/health')
def health():
    return jsonify(status='ok')

if __name__ == '__main__':
    # Bind to 0.0.0.0 so Cloud Shell web preview or containers can access it
    app.run(host='0.0.0.0', port=8080)
