#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
    echo "Environment variables loaded from .env file."
else
    echo ".env file not found. Please create one."
fi

# Debug: List all the loaded environment variables (for testing purposes)
echo "GOOGLE_CREDENTIALS_PATH is: $GOOGLE_CREDENTIALS_PATH"
