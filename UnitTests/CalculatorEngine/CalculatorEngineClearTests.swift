import XCTest
@testable import Calc

final class CalculatorEngineClearTests: CalculatorEngineBaseTests {

    func testClearDisplay() throws {
        // Test clearing display
        enterNumber(5)
        calculatorEngine.clearPressed()
        assertDisplayEquals("0", "Clear display failed")
    }

    func testClearAfterOperation() throws {
        // Test clearing after completed operation
        enterNumber(5)
        performOperation(.add)
        enterNumber(3)
        pressEquals()
        
        calculatorEngine.clearPressed()
        assertDisplayEquals("0", "Clear after operation failed")
    }
    
    func testClearDuringOperation() throws {
        // Test clearing during operation input
        enterNumber(5)
        performOperation(.add)
        calculatorEngine.clearPressed()
        
        assertDisplayEquals("0", "Clear during operation failed")
    }
    
    func testClearAfterSpecialOperation() throws {
        // Test clearing after percentage
        enterNumber(5)
        calculatorEngine.percentagePressed()
        calculatorEngine.clearPressed()
        assertDisplayEquals("0", "Clear after percentage failed")
        
        // Test clearing after negate
        enterNumber(5)
        calculatorEngine.negatePressed()
        calculatorEngine.clearPressed()
        assertDisplayEquals("0", "Clear after negate failed")
    }
}
