import Foundation

struct MathInputController {
    
    // MARK: - Operand Editing Side
    
    enum OperandSide{
        case leftHandSide
        case rightHandSide
    }
    
    private var operandSide = OperandSide.leftHandSide
    
    // MARK: - Contants
    
    private let groupingSymbol = Locale.current.groupingSeparator ?? ","
    private let decimalSymbol = Locale.current.decimalSeparator ?? "."
    private let minusSymbol = "-"
    
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

    
    // MARK: - Initialiser
    
    init() {
        lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
    }
    
    // MARK: - Extra Functions
    
    mutating func negatePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            displayNegateSymbolOndisplay(mathEquation.lhs)
            
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            displayNegateSymbolOndisplay(mathEquation.rhs)
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
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPercentageToLeftHandSide()
            lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
        case .rightHandSide:
            mathEquation.applyPercentageToRightHandSide()
            lcdDisplayText = formatLCDDisplay(mathEquation.rhs)
        }
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        mathEquation.operation = .add
        operandSide = .rightHandSide
        startEditingRightHandSide()
    }
    
    mutating func minusPressed() {
        mathEquation.operation = .subtract
        operandSide = .rightHandSide
        startEditingRightHandSide()
    }
    
    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        operandSide = .rightHandSide
        startEditingRightHandSide()
    }
    
    mutating func dividePressed() {
        mathEquation.operation = .divide
        operandSide = .rightHandSide
        startEditingRightHandSide()
    }
    
    mutating func execute() {
        mathEquation.execute()
        lcdDisplayText = formatLCDDisplay(mathEquation.result)
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
    
    mutating func numberPressed(_ number: Int) {
        guard number >= 0, number <= 9 else { return }
        
        if rawInput == "0" || (operandSide == .rightHandSide && mathEquation.rhs == nil) {
            rawInput = "\(number)"
        } else {
            rawInput += "\(number)"
        }

        if let decimalValue = Decimal(string: rawInput) {
            switch operandSide {
            case .leftHandSide:
                mathEquation.lhs = decimalValue
            case .rightHandSide:
                mathEquation.rhs = decimalValue
            }
        }
        lcdDisplayText = isEnteringDecimal ? rawInput : (numberFormatter.string(for: Decimal(string: rawInput)) ?? rawInput)
    }


    
    // MARK: - LCD Display Formatting
    
    private func formatLCDDisplay(_ decimal: Decimal?) -> String {
        guard let decimal = decimal else { return "Error" }
        
        return decimal.formatted()
    }
    
    
}




