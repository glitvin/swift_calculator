import Foundation

struct CalculatorEngine {
    
    // MARK: - Input Controller
    private var inputController = MathInputController()
    
    // MARK: - Equasion History
    
    private(set) var historyLog: [MathEquation] = []
    
    mutating func saveToHistory(_ equation: MathEquation) {
        let maxHistoryItems = 10
        historyLog.append(equation)
        if historyLog.count > maxHistoryItems { 
            historyLog.removeFirst() 
        } 
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
        inputController = MathInputController(from: inputController)
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
        if inputController.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        if inputController.isCompleted {
            populateFromResult()
        }
        inputController.addPressed()
    }
    
    mutating func minusPressed() {
        if inputController.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        if inputController.isCompleted {
            populateFromResult()
        }
        inputController.minusPressed()
    }
    
    mutating func multiplyPressed() {
        
        if inputController.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        
        if inputController.isCompleted {
            populateFromResult()
        }
        inputController.multiplyPressed()
    }
    
    mutating func dividePressed() {
        if inputController.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        if inputController.isCompleted {
            populateFromResult()
        }
        inputController.dividePressed()
    }
    
    mutating func equalsPressed() {
        guard inputController.isCompleted == false else { return }
        inputController.execute()
        
        executeMathInputController()
    }
    
    private mutating func executeMathInputController() {
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
            inputController = MathInputController(from: inputController)
        }

        inputController.numberPressed(number)
    }
    
    // MARK: - Pupulate new Math Input Controller
    
    private mutating func populateFromResult() {
        inputController = MathInputController(from: inputController)
    }
    
    // MARK: - Debug Console
    private func printEquationToDebugConsole() {
        print("Equation: " + inputController.generatePrintOut())
    }
}
