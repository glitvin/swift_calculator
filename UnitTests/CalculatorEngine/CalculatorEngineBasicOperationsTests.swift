import XCTest
@testable import Calc

final class CalculatorEngineBasicOperationsTests: XCTestCase {
    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    func testBasicMathAddition() throws {
        for lhs in 0...9 {
            for rhs in 0...9 {
                calculatorEngine.pinPadPressed(lhs)
                calculatorEngine.handleOperation(.add)
                calculatorEngine.pinPadPressed(rhs)
                calculatorEngine.equalsPressed()
                
                XCTAssertEqual(calculatorEngine.lcdDisplayText, "\(lhs + rhs)", 
                    "Basic math test failed: Expected '\(lhs + rhs)' but got '\(calculatorEngine.lcdDisplayText)'")
            }
        }
    }

    func testBasicMathSubtraction() throws {
        for lhs in 0...9 {
            for rhs in 0...9 {
                calculatorEngine.pinPadPressed(lhs)
                calculatorEngine.handleOperation(.subtract)
                calculatorEngine.pinPadPressed(rhs)
                calculatorEngine.equalsPressed()
                
                XCTAssertEqual(calculatorEngine.lcdDisplayText, "\(lhs - rhs)", 
                    "Basic math test failed: Expected '\(lhs - rhs)' but got '\(calculatorEngine.lcdDisplayText)'")
            }
        }
    }


    func testBasicMathMultiplication() throws {
        for lhs in 0...9 {
            for rhs in 0...9 {
                calculatorEngine.pinPadPressed(lhs)
                calculatorEngine.handleOperation(.multiply) 
                calculatorEngine.pinPadPressed(rhs)
                calculatorEngine.equalsPressed()
                
                XCTAssertEqual(calculatorEngine.lcdDisplayText, "\(lhs * rhs)", 
                    "Basic math test failed: Expected '\(lhs * rhs)' but got '\(calculatorEngine.lcdDisplayText)'")
            }
        }
    }

    func testBasicMathDivision() throws {
        for lhs in 0...9 {
            for rhs in 1...9 {
                calculatorEngine.pinPadPressed(lhs)
                calculatorEngine.handleOperation(.divide)
                calculatorEngine.pinPadPressed(rhs) 
                calculatorEngine.equalsPressed()
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == (Decimal(lhs) / Decimal(rhs)).formatted(),
                    "Basic math test failed: Expected '\(Decimal(lhs) / Decimal(rhs)).formatted()' but got '\(calculatorEngine.lcdDisplayText)'")
            }
        }
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
