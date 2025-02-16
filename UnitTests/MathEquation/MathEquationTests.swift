import XCTest
@testable import Calc

final class MathEquationTests: XCTestCase {
    
    // Function to generate random numbers
    func generateRandomNumber() -> (Decimal, Decimal) {
        let randomLHS = Decimal(Int.random(in: 1...100))
        let randomRHS = Decimal(Int.random(in: 1...100))
        return (randomLHS, randomRHS)
    }
    
    // Test for addition
    func testAddition() throws {
        let (lhs, rhs) = generateRandomNumber()
        
        var mathEquation = MathEquation(lhs: lhs)
        mathEquation.operation = .add
        mathEquation.rhs = rhs
        mathEquation.execute()
        
        let expectedResult = lhs + rhs
        
        if let actualResult = mathEquation.result {
            XCTAssertTrue(actualResult.isEqual(to: expectedResult), "Expected \(expectedResult), but got \(actualResult)")
        } else {
            XCTFail("Result was nil, expected \(expectedResult)")
        }
    }
    
    // Test for subtraction
    func testSubtraction() throws {
        let (lhs, rhs) = generateRandomNumber()
        
        var mathEquation = MathEquation(lhs: lhs)
        mathEquation.operation = .subtract
        mathEquation.rhs = rhs
        mathEquation.execute()
        
        let expectedResult = lhs - rhs
        
        if let actualResult = mathEquation.result {
            XCTAssertTrue(actualResult.isEqual(to: expectedResult), "Expected \(expectedResult), but got \(actualResult)")
        } else {
            XCTFail("Result was nil, expected \(expectedResult)")
        }
    }
    
    // Test for multiplication
    func testMultiplication() throws {
        let (lhs, rhs) = generateRandomNumber()
        
        var mathEquation = MathEquation(lhs: lhs)
        mathEquation.operation = .multiply
        mathEquation.rhs = rhs
        mathEquation.execute()
        
        let expectedResult = lhs * rhs
        
        if let actualResult = mathEquation.result {
            XCTAssertTrue(actualResult.isEqual(to: expectedResult), "Expected \(expectedResult), but got \(actualResult)")
        } else {
            XCTFail("Result was nil, expected \(expectedResult)")
        }
    }
    
    // Test for division
    func testDivision() throws {
        let (lhs, rhs) = generateRandomNumber()
        
        var mathEquation = MathEquation(lhs: lhs)
        mathEquation.operation = .divide
        mathEquation.rhs = rhs
        mathEquation.execute()
        
        // Prevent division by zero
        if rhs == 0 {
            XCTFail("Division by zero is not allowed")
            return
        }
        
        let expectedResult = lhs / rhs
        
        if let actualResult = mathEquation.result {
            XCTAssertTrue(actualResult.isEqual(to: expectedResult), "Expected \(expectedResult), but got \(actualResult)")
        } else {
            XCTFail("Result was nil, expected \(expectedResult)")
        }
    }
}
