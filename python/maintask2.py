import logging
import logging.handlers
import os
import time
import shutil

def rotate_log_files(log_dir, max_size=21000):
  """Rotates all log files in the specified directory that have surpassed the 10MB size.

  Args:
    log_dir: The directory where the log files are located.
  """

  for file in os.listdir(log_dir):
    filepath = os.path.join(log_dir, file)

    #10MB = 1048576
    #100MB = 104857600
    #for testing = 100000
    if os.path.isfile(filepath) and os.path.getsize(filepath) > max_size and "rotation" not in filepath:
      # The file size is greater than 10MB, and does not contain the word rotation, so rotate it.
      logging.info("Rotating log file: %s", filepath)

      # Get the current timestamp.
      timestamp = time.strftime("%Y%m%d_%H%M%S")

      # Rename the log file to include the current timestamp.
      os.rename(filepath, filepath + ".rotation.%s" % timestamp)

      # Create a new file with the original name.
      with open(filepath, "w") as f:
        pass

      #In theory its done it appends rotation and date and time to the opriginal file and create a new one empty with the original name to keep writing the logs I guess...

if __name__ == "__main__":
  log_dir = "/home/ochoamendoza"
  rotate_log_files(log_dir)
