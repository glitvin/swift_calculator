import XCTest
@testable import Calc

final class CalculatorEngineNanTests: CalculatorEngineBaseTests {
    
    func testDivisionByZero() throws {
        enterNumber(5)
        performOperation(.divide)
        enterNumber(0)
        pressEquals()
        
        assertDisplayEquals("Error", "Division by zero test failed")
    }
    
    func testZeroDividedByZero() throws {
        enterNumber(0)
        performOperation(.divide)
        enterNumber(0)
        pressEquals()
        
        assertDisplayEquals("Error", "Zero divided by zero test failed")
    }
    
    func testAdditionAfterError() throws {
        // First create an Error state
        enterNumber(5)
        performOperation(.divide)
        enterNumber(0)
        pressEquals()
        assertDisplayEquals("Error", "Division by zero should show Error")
        
        // Perform new calculation
        enterNumber(2)
        performOperation(.add)
        enterNumber(3)
        pressEquals()
        
        assertDisplayEquals("5", "Addition after Error test failed")
    }
}
