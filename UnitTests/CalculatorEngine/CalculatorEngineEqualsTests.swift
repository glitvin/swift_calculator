import XCTest
@testable import Calc

final class CalculatorEngineEqualsTests: CalculatorEngineBaseTests {
    
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
