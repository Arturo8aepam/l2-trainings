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
    if os.path.isfile(filepath) and os.path.getsize(filepath) > 1048576:
      # The file size is greater than 10MB, so rotate it.
      logging.info("Rotating log file: %s", filepath)

      # Create a new file with the original name.
      with open(filepath, "w") as f:
        pass

      # Rename the original file by appending the current date and time.
      new_filepath = filepath + ".%s" % time.strftime("%Y%m%d_%H%M%S")
      os.rename(filepath, new_filepath)
      print("El que pesa mas de 10MB: ", filepath)
      print("El nuevo: ", new_filepath)



if __name__ == "__main__":
  log_dir = "/home/ochoamendoza"
  rotate_log_files(log_dir)

