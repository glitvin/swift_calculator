import XCTest

final class CalcUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExample() throws {

    
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
                
        let resultLabel = app.staticTexts.element(boundBy: 0)

        XCTAssertTrue(resultLabel.exists, "Result UILabel not found.")
        let actualResult = resultLabel.label
            let expectedResult = "3"
            
            XCTAssertEqual(actualResult, expectedResult, "Expected result: \(expectedResult), but got: \(actualResult).")
    }

}
