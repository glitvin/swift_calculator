import XCTest
@testable import Calc

final class CalculatorEngineBasicOperationsTests: XCTestCase {
    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    func testBasicMath() throws {
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.handleOperation(.add)
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "4")
    }
    
    func testDecimalNumbers() throws {
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.decimalPressed()
        calculatorEngine.pinPadPressed(5)
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "2.5")
    }
} 