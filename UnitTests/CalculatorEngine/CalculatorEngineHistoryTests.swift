import XCTest
@testable import Calc

final class CalculatorEngineHistoryTests: XCTestCase {
    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    func testHistoryTracking() throws {
        calculatorEngine.pinPadPressed(2)
        calculatorEngine.handleOperation(.add)
        calculatorEngine.pinPadPressed(3)
        calculatorEngine.equalsPressed()
        
        let history = calculatorEngine.getHistory()
        XCTAssertEqual(history.count, 1, 
            "History tracking test failed: Expected 1 history entry but got \(history.count)")
        XCTAssertEqual(history[0].result, 5, 
                       "History tracking test failed: Expected result 5 but got \(String(describing: history[0].result))")
    }
} 
