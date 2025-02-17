import Foundation

struct CalculatorHistory {
    private(set) var items: [MathEquation] = []
    private let maxItems: Int
    
    init(maxItems: Int = 10) {
        self.maxItems = maxItems
    }
    
    mutating func add(_ equation: MathEquation) {
        items.append(equation)
        if items.count > maxItems {
            items.removeFirst()
        }
    }
}

struct CalculatorEngine {
    
    // MARK: - Input Controller
    private var inputController = MathInputController()
    
    // MARK: - Equasion History
    
    private var history = CalculatorHistory()
    
    mutating func saveToHistory(_ equation: MathEquation) {
        history.add(equation)
    }
    
    func getHistory() -> [MathEquation] {
            return history.items
        }
    
    // MARK: - LCD Display
    var lcdDisplayText: String {
        return inputController.lcdDisplayText
    }
    
    // MARK: - Error Handling
    private mutating func clearIfError() -> Bool {
        if inputController.lcdDisplayText == "Error" {
            clearPressed()
            return true
        }
        return false
    }
    
    // MARK: - Extra Functions
    mutating func clearPressed() {
        inputController = MathInputController()
    }
    
    mutating func negatePressed() {
        if clearIfError() { return }
        populateFromResultIfNeeded()
        inputController.negatePressed()
    }
    
    mutating func percentagePressed() {
        if clearIfError() { return }
        populateFromResultIfNeeded()
        inputController.percentagePressed()
    }
    
    // MARK: - Operations
    mutating func handleOperation(_ operation: MathEquation.OperationType) {
        if clearIfError() { return }
        
        if inputController.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        populateFromResultIfNeeded()
        
        switch operation {
        case .add: inputController.addPressed()
        case .subtract: inputController.minusPressed()
        case .multiply: inputController.multiplyPressed()
        case .divide: inputController.dividePressed()
        }
    }
    
    mutating func equalsPressed() {
        if inputController.isCompleted {
            inputController = MathInputController(byPopulatingCalculatinFrom: inputController)
        }
        
        guard inputController.isReadyToExecute else { return }
        executeMathInputController()
    }
    
    private mutating func executeMathInputController() {
        inputController.execute()
        let equation = MathEquation(
            lhs: inputController.mathEquation.lhs,
            rhs: inputController.mathEquation.rhs,
            operation: inputController.mathEquation.operation,
            result: inputController.mathEquation.result
        )
        saveToHistory(equation)
        
        printEquationToDebugConsole()
    }
    // MARK: - Number Input
    mutating func decimalPressed() {
        clearIfError()
        
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        inputController.decimalPressed()
    }
    
    mutating func pinPadPressed(_ number: Int) {
        guard number >= 0,
              number <= 9 else { return }
        
        clearIfError()
        
        if inputController.isCompleted {
            inputController = MathInputController()
        }
        inputController.pinPadPressed(number)
    }
    
    // MARK: - Pupulate new Math Input Controller
    
    private mutating func populateFromResult() {
        inputController = MathInputController(byPopulatingResultFrom: inputController)
    }

    private mutating func populateFromResultIfNeeded() {
        if inputController.isCompleted {
            populateFromResult()
        }
    }

    // MARK: - Debug Console
    private func printEquationToDebugConsole() {
        print("Equation: " + inputController.generatePrintOut())
    }
}
