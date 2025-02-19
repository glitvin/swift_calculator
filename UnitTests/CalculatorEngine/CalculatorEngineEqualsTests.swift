import XCTest
@testable import Calc

final class CalculatorEngineEqualsTests: XCTestCase {
    private var calculatorEngine: CalculatorEngine!
    
    override func setUp() {
        super.setUp()
        calculatorEngine = CalculatorEngine()
    }
    
    private func testContinuousEquals(
        operation: MathEquation.OperationType,
        calculate: (Decimal, Decimal) -> Decimal,
        skipZeroDivisor: Bool = false
    ) throws {
        for lhs in 0...9 {
            for rhs in 0...9 {
                if skipZeroDivisor && rhs == 0 { continue }
                
                calculatorEngine.pinPadPressed(lhs)
                calculatorEngine.handleOperation(operation)
                calculatorEngine.pinPadPressed(rhs)
                calculatorEngine.equalsPressed()
                
                var expectedResult = calculate(Decimal(lhs), Decimal(rhs))
                
                XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted(),
                              "Basic \(operation) test failed: Expected '\(expectedResult.formatted())' but got '\(calculatorEngine.lcdDisplayText)'")
                
                for _ in 0...10 {
                    calculatorEngine.equalsPressed()
                    expectedResult = calculate(expectedResult, Decimal(rhs))
                    XCTAssertTrue(calculatorEngine.lcdDisplayText == expectedResult.formatted(),
                                  "Continuous \(operation) test failed: Expected '\(expectedResult.formatted())' but got '\(calculatorEngine.lcdDisplayText)'")
                }
                calculatorEngine.clearPressed()
            }
        }
    }

    func testContinuousEqualsWithDivision() throws {
        try testContinuousEquals(
            operation: .divide,
            calculate: { $0 / $1 },
            skipZeroDivisor: true
        )
    }

    func testContinuousEqualsWithMultiplication() throws {
        try testContinuousEquals(
            operation: .multiply,
            calculate: { $0 * $1 }
        )
    }

    func testContinousEqualsWithAddition() throws {
        try testContinuousEquals(
            operation: .add,
            calculate: { $0 + $1 }
        )
    }

    func testContinousEqualsWithSubtraction() throws {
        try testContinuousEquals(
            operation: .subtract,
            calculate: { $0 - $1 }
        )
    }
}
