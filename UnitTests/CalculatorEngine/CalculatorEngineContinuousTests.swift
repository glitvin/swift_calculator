import XCTest
@testable import Calc

final class CalculatorEngineContinuousTests: XCTestCase {
    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    func testContinuousOperations() throws {
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.handleOperation(.add)
        calculatorEngine.pinPadPressed(3)
        calculatorEngine.handleOperation(.add)
        calculatorEngine.pinPadPressed(4)
        calculatorEngine.equalsPressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "9")
    }
} 