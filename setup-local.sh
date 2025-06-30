#!/bin/bash

# Local Development Setup Script for FastAPI Application
echo "Setting up local development environment..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3.11 or later."
    exit 1
fi

echo "Python version:"
python3 --version

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
echo "Activating virtual environment..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate
else
    source venv/bin/activate
fi

# Install dependencies
echo "Installing dependencies..."
cd fastapi-app
pip install --upgrade pip
pip install -r requirements.txt
pip install pytest pytest-asyncio httpx

echo "Running tests..."
pytest test_main.py -v

echo "Starting FastAPI application..."
echo "The application will be available at http://localhost:8080"
echo "Press Ctrl+C to stop the application"

python main.py
