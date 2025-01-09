
import XCTest
@testable import Calc

final class CalculatorEngineAdditionalTests: XCTestCase {
    
    func testBasicMath() throws {
        var calculatorEngine = CalculatorEngine()
        
        calculatorEngine.numberPressed(2)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(2)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "4")
    }
    
    // MARK: - Equals button
    
    func testPinPadNumberWithEquals() throws {
        var calculatorEngine = CalculatorEngine()
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                
                calculatorEngine.clearPressed() // this line can be removed after project will finished
                calculatorEngine.numberPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.numberPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
 
                XCTAssertTrue(
                                calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)",
                                "Failed for \(lhsPinPadNumber) + \(rhsPinPadNumber): got \(calculatorEngine.lcdDisplayText)"
                            )
            }
        }
    }
    
    func testContinuousPinPadNumberWithEquals() throws {
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.numberPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                print("Pressed +, lcd: \(calculatorEngine.lcdDisplayText)")
                calculatorEngine.numberPressed(rhsPinPadNumber)
                print("Pressed \(rhsPinPadNumber), lcd: \(calculatorEngine.lcdDisplayText)")
                calculatorEngine.equalsPressed()
                XCTAssertTrue(
                                calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)",
                                "Failed for \(lhsPinPadNumber) + \(rhsPinPadNumber): got \(calculatorEngine.lcdDisplayText)"
                            )
                
            }
        }
    }
    
    // MARK: - Operation buttons
    
    func testPinPadNumberByPassingEquals() throws {
        var calculatorEngine = CalculatorEngine()
        
        for lhsPinPadNumber in 0...9 {
            for rhsPinPadNumber in 0...9 {
                
                calculatorEngine.clearPressed() // this line can be removed after project will finished
                calculatorEngine.numberPressed(lhsPinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.numberPressed(rhsPinPadNumber)
                calculatorEngine.equalsPressed()
 
                XCTAssertTrue(
                                calculatorEngine.lcdDisplayText == "\(lhsPinPadNumber + rhsPinPadNumber)",
                                "Failed for \(lhsPinPadNumber) + \(rhsPinPadNumber): got \(calculatorEngine.lcdDisplayText)"
                            )
                
            }
        }
    }
}

    




