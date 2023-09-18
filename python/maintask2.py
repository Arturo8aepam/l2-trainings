import logging
import logging.handlers
import os
import time

def rotate_log_files(log_dir):
  """Rotates all log files in the specified directory that have surpassed the 10MB size.

  Args:
    log_dir: The directory where the log files are located.
  """

  for file in os.listdir(log_dir):
    filepath = os.path.join(log_dir, file)

    #10MB = 1048576
    #100MB = 104857600
    #for testing = 100000
    if os.path.isfile(filepath) and os.path.getsize(filepath) > 104857600:
      # The file size is greater than 10MB, so rotate it.
      logging.info("Rotating log file: %s", filepath)
      
      #TODO: copiar el archivo y mantener el size, validar si ya se le hizo una validacion con una palabra if path contains rotation no validation needed

      # Create a new file with the original name.
      with open(filepath, "w") as f:
        pass

      # Rename the original file by appending the current date and time.
      new_filepath = filepath + ".%s" % time.strftime("%Y%m%d_%H%M%S")
      os.rename(filepath, new_filepath)
      print("File that weight more than 10MB: ", filepath)
      print("New File name: ", new_filepath)



if __name__ == "__main__":
  log_dir = "/home/ochoamendoza"
  rotate_log_files(log_dir)

