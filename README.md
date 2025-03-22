# iOS Calculator App

A modern iOS calculator application built with Swift that features multiple themes and a calculation history.

<img width="300" alt="Image" src="https://github.com/user-attachments/assets/5a4041b9-456b-4157-b0d8-cf75c30c861d" />

## Features

- Basic arithmetic operations (addition, subtraction, multiplication, division)
- Decimal number support
- Negative number support
- Percentage calculations
- Error handling (division by zero, etc.)
- Calculation history
- Multiple color themes
- Theme persistence
- Last calculation state preservation
- Copy/Paste support
- Clean, modern UI

## Architecture

The project follows a clean architecture pattern with clear separation of concerns:

### Business Logic Layer
- `CalculatorEngine`: Main calculation logic
- `MathInputController`: Handles user input processing
- `ThemeManager`: Manages theme switching and persistence

### Data Layer
- `MathEquation`: Mathematical equation model
- `CalculatorTheme`: Theme configuration model
- `CalculatorHistory`: History management

### UI Layer
- Storyboard-based UI
- Custom UI components
- Theme-aware views

## Testing

The project includes comprehensive unit tests covering:
- Basic arithmetic operations
- Continuous calculations
- Special operations (percentage, negation)
- Error handling
- History functionality
- Clear operations
- Decimal number handling

## Themes

Available themes:
- Dark (default)
- Blood Orange
- Dark Blue
- Electro
- Light Blue
- Light
- Orange
- Pink
- Purple
- Washed Out

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## Installation

1. Clone the repository
2. Open `Calc.xcodeproj` in Xcode
3. Build and run the project
