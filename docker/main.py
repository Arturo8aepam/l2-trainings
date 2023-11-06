from flask import Flask, jsonify, request,  render_template
import json

app = Flask(__name__)

# Load the original JSON file
with open('incomes.json', 'r') as f:
    original_json = json.load(f)

@app.route("/")
def hello():
    return render_template("index.html")

@app.route("/incomes")
def get_incomes():
    return jsonify(original_json)


@app.route('/incomes', methods=['POST'])
def add_income():
    # Create a new JSON object to store the form data
    new_json = {}
    
    # Get the form data
    description = request.form["description"]
    amount = request.form["amount"]

    new_json["description"] = description
    new_json["amount"] = amount

    # Create a post request
    original_json.append(new_json)
    
    # Save the updated JSON object to the JSON file
    with open('incomes.json', 'w') as f:
        json.dump(original_json, f)
    
    # Return a success message
    return jsonify(original_json)
        

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)

#Flask automatically sets the application port to 5000