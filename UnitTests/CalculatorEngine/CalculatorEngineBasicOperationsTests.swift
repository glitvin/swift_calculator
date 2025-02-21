import XCTest
@testable import Calc

final class CalculatorEngineBasicOperationsTests: CalculatorEngineBaseTests {
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
        enterNumber(0)
        assertDisplayEquals("0", "First digit test failed")
        
        calculatorEngine.decimalPressed()
        assertDisplayEquals("0.", "Decimal point test failed")
        
        enterNumber(1)
        assertDisplayEquals("0.1", "Decimal number test failed")
        
        // Test 1.5
        calculatorEngine = CalculatorEngine() 
        enterNumber(1)
        assertDisplayEquals("1", "First digit test failed")
        
        calculatorEngine.decimalPressed()
        assertDisplayEquals("1.", "Decimal point test failed")
        
        enterNumber(5)
        assertDisplayEquals("1.5", "Decimal number test failed")
    }

    func testDecimalNumbersWithAddition() throws {
        // Test: 1.5 + 0.5 = 2
        enterNumber(1)
        calculatorEngine.decimalPressed()
        enterNumber(5)
        performOperation(.add)
        enterNumber(0)
        calculatorEngine.decimalPressed()
        enterNumber(5)
        pressEquals()
        assertDisplayEquals("2", "Decimal numbers with operation test failed")
    }

    func testDecimalNumbersWithSubtraction() throws {
        // Test: 1.5 - 0.5 = 1
        calculatorEngine = CalculatorEngine() 
        enterNumber(1)
        calculatorEngine.decimalPressed()
        enterNumber(5)
        performOperation(.subtract)
        enterNumber(0)
        calculatorEngine.decimalPressed()
        enterNumber(5)
        pressEquals()
        assertDisplayEquals("1", "Decimal numbers with operation test failed")
    }
    
    func testDecimalNumbersWithMultiplication() throws {
        // Test: 1.5 * 0.5 = 0.75
        calculatorEngine = CalculatorEngine() 
        enterNumber(1)
        calculatorEngine.decimalPressed()
        enterNumber(5)
        performOperation(.multiply) 
        enterNumber(0)
        calculatorEngine.decimalPressed()
        enterNumber(5)
        pressEquals()
        assertDisplayEquals("0,75", "Decimal numbers with operation test failed")
    }

    func testDecimalNumbersWithDivision() throws {
        // Test: 1.5 / 0.5 = 3
        calculatorEngine = CalculatorEngine() 
        enterNumber(1)
        calculatorEngine.decimalPressed()
        enterNumber(5)
        performOperation(.divide)
        enterNumber(0)
        calculatorEngine.decimalPressed()
        enterNumber(5)
        pressEquals()
        assertDisplayEquals("3", "Decimal numbers with operation test failed")
    }

}
