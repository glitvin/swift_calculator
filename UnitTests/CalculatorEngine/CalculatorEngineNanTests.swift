import XCTest
@testable import Calc

final class CalculatorEngineNanTests: XCTestCase {

    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    func testDivisionByZero() throws {
        calculatorEngine.pinPadPressed(5)
        calculatorEngine.handleOperation(.divide)
        calculatorEngine.pinPadPressed(0)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "Error", 
            "Division by zero test failed: Expected 'Error' but got '\(calculatorEngine.lcdDisplayText)'")
    }
    
    func testZeroDividedByZero() throws {
        calculatorEngine.pinPadPressed(0)
        calculatorEngine.handleOperation(.divide)
        calculatorEngine.pinPadPressed(0)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "Error", 
            "Zero divided by zero test failed: Expected 'Error' but got '\(calculatorEngine.lcdDisplayText)'")
    }
    
    func testAdditionAfterError() throws {
        // First create an Error state
        calculatorEngine.pinPadPressed(5)
        calculatorEngine.handleOperation(.divide)
        calculatorEngine.pinPadPressed(0)
        calculatorEngine.equalsPressed()
        
        // Perform new calculation
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.handleOperation(.add)
        calculatorEngine.pinPadPressed(3)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "5", 
            "Addition after Error test failed: Expected '5' but got '\(calculatorEngine.lcdDisplayText)'")
    }
    
}
