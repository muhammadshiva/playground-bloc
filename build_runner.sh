#!/bin/bash

# Flutter Build Runner Script
# This script runs the Flutter build runner to generate code

echo "Running Flutter build runner..."
flutter pub run build_runner build --delete-conflicting-outputs

echo "Build runner completed!"
