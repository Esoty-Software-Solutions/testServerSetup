#!/bin/bash

set -e

# Run migration command
npm run migrate

# Start the application
exec node .