import XCTest
@testable import Calc

final class CalculatorEngineContinuousTests: CalculatorEngineBaseTests {
    
    func testContinuousOperationsAddition() throws {
        testContinuousOperation(
            operation: .add,
            firstNumber: 2,
            secondNumber: 3,
            thirdNumber: 4,
            expectedResult: "9",
            message: "Continuous addition test failed"
        )
    }

    func testContinuousOperationsSubtraction() throws {
        testContinuousOperation(
            operation: .subtract,
            firstNumber: 9,
            secondNumber: 5,
            thirdNumber: 2,
            expectedResult: "2",
            message: "Continuous subtraction test failed"
        )
    }
    
    func testContinuousOperationsMultiplication() throws {
        testContinuousOperation(
            operation: .multiply,
            firstNumber: 9,
            secondNumber: 5,
            thirdNumber: 2,
            expectedResult: "90",
            message: "Continuous multiplication test failed"
        )
    }

    func testContinuousOperationsDivision() throws {
        testContinuousOperation(
            operation: .divide,
            firstNumber: 8,
            secondNumber: 2,
            thirdNumber: 2,
            expectedResult: "2",
            message: "Continuous division test failed"
        )
    }
} 