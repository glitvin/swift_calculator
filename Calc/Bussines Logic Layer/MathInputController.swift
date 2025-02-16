import Foundation

struct MathInputController {
    
    // MARK: - Operand Editing Side
    
    enum OperandSide{
        case leftHandSide
        case rightHandSide
    }
    
    private var operandSide = OperandSide.leftHandSide
    
    // MARK: - Initialise
    
    init() {
        mathEquation = MathEquation(lhs: .zero)
        lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
    }

    init(byPopulatingResultFrom mathInputController: MathInputController) {
        mathEquation = MathEquation(
            lhs: mathInputController.mathEquation.result ?? .zero
        )
        lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
    }
    
    init(byPopulatingCalculatinFrom mathInputController: MathInputController) {
        mathEquation = MathEquation(
            lhs: mathInputController.result ?? .zero,
            rhs: mathInputController.rhs,
            operation: mathInputController.operation
        )
        lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
    }
    
    // MARK: - Contants
    
    private let groupingSymbol = Locale.current.groupingSeparator ?? ","
    private let decimalSymbol = Locale.current.decimalSeparator ?? "."
    private let minusSymbol = "-"
    private let errorMessage = "Error"
    
    // MARK: - Number Formatter
    
    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = groupingSymbol
        formatter.groupingSize = 3
        return formatter
    }()
    
    
    // MARK: - Math Equation
    
    private(set) var mathEquation = MathEquation(lhs: .zero)
    private var isEnteringDecimal = false
    
    // MARK: - LCD Display
    
    var lcdDisplayText = ""
    private var rawInput: String = ""
    
    // MARK: - Equatuion Wrapper
    
    private var operation: MathEquation.OperationType? {
        get {
            return mathEquation.operation
        }
        set {
            mathEquation.operation = newValue
        }
    }
    
    private var lhs: Decimal {
        get {
            return mathEquation.lhs
        }
        set {
            mathEquation.lhs = newValue
            lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
        }
    }
    
    private var rhs: Decimal? {
        get {
            return mathEquation.rhs
        }
        set {
            mathEquation.rhs = newValue
            lcdDisplayText = formatLCDDisplay(mathEquation.rhs)
        }
    }
    
    private var result: Decimal? {
        get {
            return mathEquation.result
        }
        set {
            mathEquation.result = newValue
            lcdDisplayText = formatLCDDisplay(mathEquation.result)
        }
    }
    
    func generatePrintOut() -> String {
        return mathEquation.generatePrintOut()
    }
    
    
    // MARK: - Extra Functions
    
    mutating func negatePressed() {
        guard isCompleted == false else { return }
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            displayNegateSymbolOndisplay(lhs)
            
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            displayNegateSymbolOndisplay(rhs)
        }
    }
    
    mutating private func displayNegateSymbolOndisplay(_ decimal: Decimal?) {
        guard let decimal = decimal else { return }
        let isNegativeValue = decimal < 0 ? true : false
        if isNegativeValue {
            lcdDisplayText.addPrefixIfNeeded(minusSymbol)
        } else {
            lcdDisplayText.removePrefixIfNeeded(minusSymbol)
        }
    }
    
    mutating func percentagePressed() {
        guard isCompleted == false else { return }
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPercentageToLeftHandSide()
            lcdDisplayText = formatLCDDisplay(lhs)
        case .rightHandSide:
            mathEquation.applyPercentageToRightHandSide()
            lcdDisplayText = formatLCDDisplay(rhs)
        }
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        guard isCompleted == false else { return }
        
        operation = .add
        operandSide = .rightHandSide
        startEditingRightHandSide()
    }
    
    mutating func minusPressed() {
        guard isCompleted == false else { return }
        
        operation = .subtract
        operandSide = .rightHandSide
        startEditingRightHandSide()
    }
    
    mutating func multiplyPressed() {
        guard isCompleted == false else { return }
        
        operation = .multiply
        operandSide = .rightHandSide
        startEditingRightHandSide()
    }
    
    mutating func dividePressed() {
        guard isCompleted == false else { return }
        
        operation = .divide
        operandSide = .rightHandSide
        startEditingRightHandSide()
    }
    
    mutating func execute() {
        guard isCompleted == false else { return }
        
        mathEquation.execute()
        lcdDisplayText = formatLCDDisplay(result)
    }
    
    // MARK: - Editing Right Hand Side
    
    private mutating func startEditingRightHandSide() {
        operandSide = .rightHandSide
        isEnteringDecimal = false
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        if !isEnteringDecimal {
            isEnteringDecimal = true
            rawInput += rawInput.isEmpty ? "0." : "."
            lcdDisplayText = rawInput
        }
    }
    
    mutating func pinPadPressed(_ number: Int) {
        guard number >= 0, number <= 9 else { return }
        
        if rawInput == "0" || (operandSide == .rightHandSide && rhs == nil) {
            rawInput = "\(number)"
        } else {
            rawInput += "\(number)"
        }
        
        if let decimalValue = Decimal(string: rawInput) {
            switch operandSide {
            case .leftHandSide:
                lhs = decimalValue
            case .rightHandSide:
                rhs = decimalValue
            }
        }
        lcdDisplayText = isEnteringDecimal ? rawInput : (numberFormatter.string(for: Decimal(string: rawInput)) ?? rawInput)
    }
    
    // MARK: - LCD Display Formatting
    
    private func formatLCDDisplay(_ decimal: Decimal?) -> String {
        guard
            let decimal = decimal,
            decimal.isNaN == false
        else { return errorMessage }
        
        return decimal.formatted()
    }
    
    // MARK: - Computed Properties
    
    var isCompleted: Bool {
        return mathEquation.executed
    }
    
    var isReadyToExecute: Bool {
        guard mathEquation.executed == false else {
            return false
        }
        if let _ = operation,
           let _ = rhs {
            return true
        }
        return false
    }
}




