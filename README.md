# Quiz App

A simple Quiz app built with Swift and UIKit. This app allows users to answer multiple-choice questions and get immediate feedback on whether their answers are correct or not.

## Features

- Displays a series of questions for the user to answer.
- Provides immediate feedback on the user's input (correct or incorrect).
- Allows users to view the correct answer if they don't know it.
- Changes the background color to visually indicate correct (green) or incorrect (red) answers.
- Automatically moves to the next question when the user answers correctly.

## How It Works

1. The app displays one question at a time in a label.
2. The user enters their answer in a text field.
3. When the user taps the "Check" button:
   - If the answer is correct, a success message is shown, and the background turns green.
   - If the answer is incorrect, an error message is displayed, and the background turns red.
4. The user can tap "Show Answer" to view the correct answer.
5. The "Next Question" button loads the next question (only if the previous answer was correct).
6. When all questions are answered, the quiz restarts from the beginning.

## Code Overview

- **ViewController.swift**: 
   - Handles the app's UI and logic.
   - Defines the `Question` struct to model questions and answers.
   - Manages the current question index and user input.
   - Contains helper methods for showing alerts and changing the background color.

### Key Methods
- `getQuestion()`: Loads the current question and resets the UI.
- `checkBtn(_:)`: Validates the user's input and provides feedback.
- `showAnswerBtn(_:)`: Shows the correct answer in an alert.
- `nextQuestionBtn(_:)`: Advances to the next question if the user's answer was correct.
- `showAlert(title:message:btnTitle:)`: Displays an alert with a custom message.

## Requirements

- iOS 13.0+
- Xcode 13 or higher
- Swift 5

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/quiz-app.git
   cd quiz-app
  ```

2. Clone the repository:
    Open Quiz.xcodeproj in Xcode.
  
3. Build and run the project on a simulator or a physical device.
