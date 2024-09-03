#!/bin/bash

# Crontab settings
# @reboot /path/to/fastapi_production_startup_command.sh

# Step 1: Kill existing FastAPI process on port 8000
PID=$(ps aux | grep "[u]vicorn.*8000" | awk '{print $2}')

if [ -n "$PID" ]; then
  echo "Killing existing FastAPI server process with PID: $PID"
  kill -9 $PID
  echo "Process killed."
else
  echo "No process found on port 8000."
fi

# Step 2: Kill existing multiprocessing processes
MUL_PROC_PIDS=$(ps aux | grep "[m]ultiprocessing.spawn" | awk '{print $2}')

if [ -n "$MUL_PROC_PIDS" ]; then
  echo "Killing existing multiprocessing processes with PIDs: $MUL_PROC_PIDS"
  kill -9 $MUL_PROC_PIDS
  echo "Multiprocessing processes killed."
else
  echo "No multiprocessing processes found."
fi

# Step 3: Navigate to the project directory
cd /path/to/your/server
git pull

# Step 4: Activate the Python virtual environment
source venv/bin/activate

# Step 5: Start the FastAPI server in the background
nohup uvicorn main:app --host=0.0.0.0 --port=8000 --workers=12 &

# Step 6: Deactivate the virtual environment
deactivate 

# Step 7: Return to the original directory
cd -

echo "All servers started!!!"
