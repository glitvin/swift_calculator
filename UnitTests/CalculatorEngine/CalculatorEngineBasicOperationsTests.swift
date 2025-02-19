import XCTest
@testable import Calc

final class CalculatorEngineBasicOperationsTests: XCTestCase {
    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    private func testBasicOperation(
        operation: MathEquation.OperationType,
        calculate: (Int, Int) -> Decimal,
        skipZeroDivisor: Bool = false
    ) throws {
        for lhs in 0...9 {
            for rhs in 0...9 {
                if skipZeroDivisor && rhs == 0 { continue }
                
                calculatorEngine.pinPadPressed(lhs)
                calculatorEngine.handleOperation(operation)
                calculatorEngine.pinPadPressed(rhs)
                calculatorEngine.equalsPressed()
                
                let expectedResult = calculate(lhs, rhs)
                XCTAssertEqual(calculatorEngine.lcdDisplayText, expectedResult.formatted(), 
                    "Basic math test failed: Expected '\(expectedResult.formatted())' but got '\(calculatorEngine.lcdDisplayText)'")
            }
        }
    }
    
    func testBasicMathAddition() throws {
        try testBasicOperation(
            operation: .add,
            calculate: { Decimal($0 + $1) }
        )
    }
    
    func testBasicMathSubtraction() throws {
        try testBasicOperation(
            operation: .subtract,
            calculate: { Decimal($0 - $1) }
        )
    }
    
    func testBasicMathMultiplication() throws {
        try testBasicOperation(
            operation: .multiply,
            calculate: { Decimal($0 * $1) }
        )
    }
    
    func testBasicMathDivision() throws {
        try testBasicOperation(
            operation: .divide,
            calculate: { Decimal($0) / Decimal($1) },
            skipZeroDivisor: true
        )
    }

    func testDecimalNumbers() throws {
        // Test 0.1
        calculatorEngine.pinPadPressed(0)
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "0", 
            "First digit test failed: Expected '0' but got '\(calculatorEngine.lcdDisplayText)'")
        
        calculatorEngine.decimalPressed()
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "0.", 
            "Decimal point test failed: Expected '0.' but got '\(calculatorEngine.lcdDisplayText)'")
        
        calculatorEngine.pinPadPressed(1)
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "0.1", 
            "Decimal number test failed: Expected '0.1' but got '\(calculatorEngine.lcdDisplayText)'")
        
        // Test 1.5
        calculatorEngine = CalculatorEngine() // Reset calculator
        calculatorEngine.pinPadPressed(1)
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "1", 
            "First digit test failed: Expected '1' but got '\(calculatorEngine.lcdDisplayText)'")
        
        calculatorEngine.decimalPressed()
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "1.", 
            "Decimal point test failed: Expected '1.' but got '\(calculatorEngine.lcdDisplayText)'")
        
        calculatorEngine.pinPadPressed(5)
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "1.5", 
            "Decimal number test failed: Expected '1.5' but got '\(calculatorEngine.lcdDisplayText)'")
    }

    func testNegativeNumbers() throws {
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.negatePressed()
        calculatorEngine.handleOperation(.subtract)
        calculatorEngine.pinPadPressed(3)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "-5", 
            "Negative numbers test failed: Expected '-5' but got '\(calculatorEngine.lcdDisplayText)'")
    }
} 
