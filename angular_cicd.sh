#!/usr/bin/env bash

# Exit on errors
set -e

# Variables
PROJECT_DIR="/path/to/your/folder"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FOLDER="dist_backup_${TIMESTAMP}"

echo "=== Navigating to project directory: $PROJECT_DIR ==="
cd "$PROJECT_DIR"

echo "=== Pulling latest changes from main branch ==="
git pull origin main
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to pull from 'main' branch."
  exit 1
fi

# Check if 'dist/' folder exists
if [ -d "dist" ]; then
  echo "=== Backing up current 'dist' folder to '$BACKUP_FOLDER' ==="
  mv dist "$BACKUP_FOLDER"
else
  echo "No existing 'dist' folder found. Skipping backup."
fi

echo "=== Running 'npm run build' (or 'ng build') ==="
# Use your preferred Angular build command:
# npm run build
#   or
# ng build --configuration production

if ! npm run build; then
  echo "ERROR: Build failed!"
  
  # Revert to the old dist if there was a backup
  if [ -d "$BACKUP_FOLDER" ]; then
    echo "=== Reverting to old dist ==="
    rm -rf dist
    mv "$BACKUP_FOLDER" dist
  fi
  
  exit 1
fi

# Build succeeded, remove the old backup
if [ -d "$BACKUP_FOLDER" ]; then
  echo "=== Build successful! Removing backup folder '$BACKUP_FOLDER' ==="
  rm -rf "$BACKUP_FOLDER"
fi

echo "=== Deployment complete ==="
