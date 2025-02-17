import XCTest
@testable import Calc

final class CalculatorEngineSpecialOperationsTests: XCTestCase {
    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    func testNegateNumber() throws {
        calculatorEngine.pinPadPressed(5)
        calculatorEngine.negatePressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "-5", 
            "Negate operation test failed: Expected '-5' but got '\(calculatorEngine.lcdDisplayText)'")
    }
    
    func testPercentage() throws {
        calculatorEngine.pinPadPressed(5)
        calculatorEngine.percentagePressed()
        
        XCTAssertEqual(calculatorEngine.lcdDisplayText, "0,05", 
            "Percentage operation test failed: Expected '0,05' but got '\(calculatorEngine.lcdDisplayText)'")
    }
} 