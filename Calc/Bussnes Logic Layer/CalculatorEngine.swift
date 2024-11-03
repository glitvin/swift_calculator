import Foundation

struct CalculatorEngine {
    
    // MARK: - Input Controller
    
    private var inputController = MathInputController()
    
    // MARK: - Equasion History
    
    private var historyLog: [MathEquation] = []
    
    // MARK: - LCD Display
    
    var lcdDisplayText: String {
        return inputController.lcdDisplayText
    }
    
    // MARK: - Extra Functions

    mutating func clearPressed() {
        inputController = MathInputController()
    }
    
    mutating func negatePressed() {
        guard inputController.isCompleted == false else { return }
        
        inputController.negatePressed()
    }
    
    mutating func percentagePressed() {
        guard inputController.isCompleted == false else { return }
        
        inputController.percentagePressed()
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        inputController.addPressed()
    }
    
    mutating func minusPressed() {
        inputController.minusPressed()
    }
    
    mutating func multiplyPressed() {
        guard inputController.isCompleted == false else { return }
        
        inputController.multiplyPressed()
    }
    
    mutating func dividePressed() {
        guard inputController.isCompleted == false else { return }
        
        inputController.dividePressed()
    }
    
    mutating func equalsPressed() {
        guard inputController.isCompleted == false else { return }
        
        inputController.execute()
        historyLog.append(inputController.mathEquation)
        printEquationToDebugConsole()
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        guard inputController.isCompleted == false else { return }
        
        inputController.decimalPressed()
    }
    
    mutating func numberPressed(_ number: Int) {
        guard inputController.isCompleted == false else { return }
        
        inputController.numberPressed(number)
    }
    
    // MARK: - Debug Console
    
    private func printEquationToDebugConsole() {
        print("Equation: " + inputController.mathEquation.generatePrintOut())
    }
    
    // MARK: - History Log
    
    private mutating func clearHistory() {
        historyLog = []
    }
}
