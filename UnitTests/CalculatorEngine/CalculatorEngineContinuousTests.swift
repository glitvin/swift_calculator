import XCTest
@testable import Calc

final class CalculatorEngineContinuousTests: XCTestCase {
    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    func testContinuousOperationsAddition() throws {
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.handleOperation(.add)
        calculatorEngine.pinPadPressed(3)
        calculatorEngine.handleOperation(.add)
        calculatorEngine.pinPadPressed(4)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "9", 
            "Continuous addition test failed: Expected '9' but got '\(calculatorEngine.lcdDisplayText)'")
    }

    func testContinuousOperationsSubtraction() throws {
        calculatorEngine.pinPadPressed(9)
        calculatorEngine.handleOperation(.subtract)
        calculatorEngine.pinPadPressed(5)
        calculatorEngine.handleOperation(.subtract)
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "2", 
            "Continuous subtraction test failed: Expected '2' but got '\(calculatorEngine.lcdDisplayText)'")
    }
    
    func testContinuousOperationsMultiplication() throws {
        calculatorEngine.pinPadPressed(9)
        calculatorEngine.handleOperation(.multiply)
        calculatorEngine.pinPadPressed(5)
        calculatorEngine.handleOperation(.multiply)
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "90", 
            "Continuous multiplication test failed: Expected '90' but got '\(calculatorEngine.lcdDisplayText)'")
    }

    func testContinuousOperationsDivision() throws {
        calculatorEngine.pinPadPressed(8)
        calculatorEngine.handleOperation(.divide)
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.handleOperation(.divide)
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "2", 
            "Continuous division test failed: Expected '2' but got '\(calculatorEngine.lcdDisplayText)'")
    }   
} 