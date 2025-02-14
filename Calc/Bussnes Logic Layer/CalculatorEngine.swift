import Foundation

struct CalculatorEngine {
    
    // MARK: - Input Controller
    private var inputController = MathInputController()
    
    // MARK: - Equasion History
    
    private(set) var historyLog: [MathEquation] = []
    
    mutating func saveToHistory(_ equation: MathEquation) {
           historyLog.append(equation)
           if historyLog.count > 10 { historyLog.removeFirst() } 
       }
    
    func getHistory() -> [MathEquation] {
            return historyLog
        }
    
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
        if inputController.isCompleted {
            let result = inputController.result ?? Decimal(0)
            inputController = MathInputController()
            inputController.lhs = result
        }
        
        inputController.addPressed()
    }
    
    mutating func minusPressed() {
        guard inputController.isCompleted == false else { return }
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
        
        let equation = MathEquation(lhs: inputController.mathEquation.lhs, rhs: inputController.mathEquation.rhs, operation: inputController.mathEquation.operation, result: inputController.mathEquation.result)
            saveToHistory(equation)
        
        printEquationToDebugConsole()
    }
    
    // MARK: - Number Input
    mutating func decimalPressed() {
        guard inputController.isCompleted == false else { return }
        inputController.decimalPressed()
    }
    
    mutating func numberPressed(_ number: Int) {
        if inputController.isCompleted {
            inputController = MathInputController()
        }

        inputController.numberPressed(number)
    }
    
    // MARK: - Debug Console
    private func printEquationToDebugConsole() {
        print("Equation: " + inputController.mathEquation.generatePrintOut())
    }
}
