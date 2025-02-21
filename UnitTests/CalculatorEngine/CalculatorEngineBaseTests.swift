import XCTest
@testable import Calc

class CalculatorEngineBaseTests: XCTestCase {
    var calculatorEngine: CalculatorEngine!
    var history: [MathEquation] { calculatorEngine.getHistory() }
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    // MARK: - Helper Methods
    
    func enterNumber(_ number: Int) {
        calculatorEngine.pinPadPressed(number)
    }
    
    func performOperation(_ operation: MathEquation.OperationType) {
        calculatorEngine.handleOperation(operation)
    }
    
    func pressEquals() {
        calculatorEngine.equalsPressed()
    }
    
    func assertDisplayEquals(_ expected: String, _ message: String) {
        XCTAssertEqual(calculatorEngine.lcdDisplayText, expected, message)
    }
    
    func assertHistoryCount(_ expected: Int, _ message: String = "") {
        XCTAssertEqual(history.count, expected, 
            message.isEmpty ? "Expected \(expected) history entries but got \(history.count)" : message)
    }
    
    func assertHistoryResult(at index: Int, equals expected: Decimal, _ message: String = "") {
        guard index >= 0, index < history.count else {
            XCTFail("History index \(index) is out of range. History contains only \(history.count) items")
            return
        }
        
        XCTAssertEqual(history[index].result, expected, 
            message.isEmpty ? "Expected result \(expected) but got \(history[index].result)" : message)
    }
    
    // MARK: - Test Helper Methods
    
    func testBasicOperation(
        operation: MathEquation.OperationType,
        calculate: (Int, Int) -> Decimal,
        skipZeroDivisor: Bool = false
    ) throws {
        for lhs in 0...9 {
            for rhs in 0...9 {
                if skipZeroDivisor && rhs == 0 { continue }
                
                calculatorEngine.pinPadPressed(lhs)
                calculatorEngine.handleOperation(operation)
                calculatorEngine.pinPadPressed(rhs)
                calculatorEngine.equalsPressed()
                
                let expectedResult = calculate(lhs, rhs)
                XCTAssertEqual(calculatorEngine.lcdDisplayText, expectedResult.formatted(),
                    "Basic math test failed: Expected '\(expectedResult.formatted())' but got '\(calculatorEngine.lcdDisplayText)'")
            }
        }
    }
    
    func testContinuousOperation(
        operation: MathEquation.OperationType,
        firstNumber: Int,
        secondNumber: Int,
        thirdNumber: Int,
        expectedResult: String,
        message: String
    ) {
        enterNumber(firstNumber)
        performOperation(operation)
        enterNumber(secondNumber)
        performOperation(operation)
        enterNumber(thirdNumber)
        pressEquals()
        
        assertDisplayEquals(expectedResult, message)
    }
    
    func testContinuousEquals(
        operation: MathEquation.OperationType,
        calculate: (Decimal, Decimal) -> Decimal,
        skipZeroDivisor: Bool = false
    ) throws {
        for lhs in 0...9 {
            for rhs in 0...9 {
                if skipZeroDivisor && rhs == 0 { continue }
                
                enterNumber(lhs)
                performOperation(operation)
                enterNumber(rhs)
                pressEquals()
                
                var expectedResult = calculate(Decimal(lhs), Decimal(rhs))
                assertDisplayEquals(expectedResult.formatted(), 
                    "Basic \(operation) test failed: Expected '\(expectedResult.formatted())' but got '\(calculatorEngine.lcdDisplayText)'")
                
                for _ in 0...10 {
                    pressEquals()
                    expectedResult = calculate(expectedResult, Decimal(rhs))
                    assertDisplayEquals(expectedResult.formatted(),
                        "Continuous \(operation) test failed: Expected '\(expectedResult.formatted())' but got '\(calculatorEngine.lcdDisplayText)'")
                }
                calculatorEngine.clearPressed()
            }
        }
    }
}
