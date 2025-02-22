import Foundation

struct MathEquation: Codable {
    
    enum OperationType: Codable {
        case add
        case subtract
        case multiply
        case divide
    }
    
    // lhs/rhs - left/right hand side
    
    var lhs: Decimal
    var rhs: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
    //  MARK: - Execution
    
    var executed: Bool {
        return result != nil 
    }
    
    mutating func execute(){
        
        guard
            let rhs = self.rhs,
            let operation = self.operation else {
                return
            }
        switch operation {
        case .add:
            result = lhs + rhs
        case .subtract:
            result = lhs - rhs
        case .multiply:
            result = lhs * rhs
        case .divide:
               if rhs != 0 {
                   result = lhs / rhs
               } else {
                   result = nil 
               }
        }
    }
    
    // MARK: - Negate
    
    mutating func negateLeftHandSide() {
        lhs.negate()
    }
    
    mutating func negateRightHandSide() {
        rhs?.negate()
    }
        
    // MARK: - Percentage
    
    private func calculatePercentageValue(_ decimal: Decimal?) -> Decimal {
        guard let decimal = decimal else {return.nan}
        return decimal / 100
    }
    
    mutating func applyPercentageToLeftHandSide(){
        lhs = calculatePercentageValue(lhs)
    }

    mutating func applyPercentageToRightHandSide() {
        rhs = calculatePercentageValue(rhs)
    }
    
    // MARK: - String Representation
    
    func generatePrintOut() -> String {
        let operationString = generateStringRepresentationOfOperation()
        return lhs.formatted() + " " + operationString + " " + (rhs?.formatted() ?? "") + " = " + (result?.formatted() ?? " ")
    }
    
   func generateStringRepresentationOfOperation() -> String {
        switch operation {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        case .none:
            return ""
        }
    }
}
