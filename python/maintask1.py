import json

def validate_json(json_file):
  """Validates if all values for all keys inside a JSON file are not in blank for all iterations levels.

  Args:
    json_file: The path to the JSON file.

  Returns:
    A list of keys with empty values.
  """

  with open(json_file) as json_file:
    json_data = json.load(json_file)

  empty_keys = []

  def _validate_json(json_data, keys):
    for key, value in json_data.items():
      if not value:
        empty_keys.append(key)
      elif isinstance(value, dict):
        _validate_json(value, keys + [key])

  _validate_json(json_data, [])

  return empty_keys


if __name__ == "__main__":
  json_file = "my_json_file.json"
  empty_keys = validate_json(json_file)

  if empty_keys:
    print("The following keys have empty values:")
    for key in empty_keys:
      print(key)
  else:
    print("All values for keys inside the JSON file are not in blank.")

