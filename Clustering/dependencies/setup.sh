#!/bin/bash

# Variables
ENV_NAME="complearn"
PYTHON_VERSION="3.10"

# Create conda environment with Python 3.10 if it doesn't exist
if ! conda info --envs | grep -q $ENV_NAME; then
    echo "Creating conda environment: $ENV_NAME with Python $PYTHON_VERSION"
    conda create -n $ENV_NAME python=$PYTHON_VERSION -y
else
    echo "Environment $ENV_NAME already exists."
fi

# Activate the environment
echo "Activating conda environment: $ENV_NAME"
conda activate $ENV_NAME

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Update requirements.txt with any new packages
echo "Updating requirements.txt..."
pip freeze > requirements.txt

# Optionally, install the project
echo "Installing the project..."
pip install .

echo "Environment setup complete!"
