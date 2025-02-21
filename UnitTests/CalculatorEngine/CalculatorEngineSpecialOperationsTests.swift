import XCTest
@testable import Calc

final class CalculatorEngineSpecialOperationsTests: CalculatorEngineBaseTests {
    func testNegateNumber() throws {
        enterNumber(5)
        calculatorEngine.negatePressed()
        
        assertDisplayEquals("-5", "Negate operation test failed")
    }
    
    func testPercentage() throws {
        enterNumber(5)
        calculatorEngine.percentagePressed()
        
        assertDisplayEquals("0,05", "Percentage operation test failed")
    }
    
    func testNegateWithMultipleOperations() throws {
        // Test: 5 -> negate -> -5 -> negate -> 5
        enterNumber(5)
        calculatorEngine.negatePressed()
        assertDisplayEquals("-5", "First negate failed")
        
        calculatorEngine.negatePressed()
        assertDisplayEquals("5", "Second negate failed")
    }

    func testNegateWithOperation() throws {
        // Test: 5 -> negate -> -5 -> add 3 -> -2
        enterNumber(5)
        calculatorEngine.negatePressed()
        assertDisplayEquals("-5", "First negate failed")
        
        performOperation(.add)
        enterNumber(3)
        pressEquals()
        assertDisplayEquals("-2", "Addition failed")
    }
    
    func testPercentageWithOperation() throws {
        // Test: 8 + 4% = 8.32 (8 + 0.04)
        enterNumber(8)
        performOperation(.add)
        
        enterNumber(4)
        calculatorEngine.percentagePressed()  // Convert to 4%
        
        pressEquals()
        assertDisplayEquals("8,04", "Percentage with addition failed")
    }
} 
