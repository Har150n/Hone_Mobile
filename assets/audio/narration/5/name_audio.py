import os

# Get the list of files in the current folder
files = os.listdir()

# Filter only the .mp3 files (you can adjust the file extension as needed)
mp3_files = [file for file in files if file.endswith(".mp3")]

# Sort the files by name
mp3_files.sort()

# Initialize a counter for renaming
counter = 1

# Iterate through the sorted files and rename them
for file in mp3_files:
    # Generate the new file name
    new_name = f"story_5_narration_{counter}.mp3"
    
    # Rename the file
    os.rename(file, new_name)
    
    # Increment the counter for the next file
    counter += 1

print("Files renamed successfully.")
