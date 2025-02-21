import XCTest
@testable import Calc

final class CalculatorEngineHistoryTests: CalculatorEngineBaseTests {
    
    func testHistoryTracking() throws {
        enterNumber(2)
        performOperation(.add)
        enterNumber(3)
        pressEquals()
        
        assertHistoryCount(1)
        assertHistoryResult(at: 0, equals: 5)
    }
    
    func testMultipleHistoryItems() throws {
        // First calculation: 2 + 3 = 5
        enterNumber(2)
        performOperation(.add)
        enterNumber(3)
        pressEquals()
        
        // Second calculation: 5 * 4 = 20
        enterNumber(5)
        performOperation(.multiply)
        enterNumber(4)
        pressEquals()
        
        // Third calculation: 8 - 3 = 5
        enterNumber(8)
        performOperation(.subtract)
        enterNumber(3)
        pressEquals()
        
        // Verify history count
        assertHistoryCount(3)
        
        // Verify results in chronological order (oldest first)
        // Index 0 contains the oldest item (2 + 3 = 5)
        // Index 1 contains the middle item (5 * 4 = 20)
        // Index 2 contains the newest item (8 - 3 = 5)
        assertHistoryResult(at: 0, equals: 5)   // 2 + 3
        assertHistoryResult(at: 1, equals: 20)  // 5 * 4
        assertHistoryResult(at: 2, equals: 5)   // 8 - 3
    }
    
    func testHistoryLimitedToTenItems() throws {
        // Add 11 calculations: 1+1, 2+2, 3+3, ..., 9+9, 1+1, 2+2
        for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2] {
            enterNumber(i)
            performOperation(.add)
            enterNumber(i)
            pressEquals()
        }
        
        // Verify we only keep 10 items
        assertHistoryCount(10)
        
        // Verify the oldest calculation (1+1) was removed
        // and newest calculations are present
        // Index 0 contains the oldest remaining item (2+2)
        // Index 9 contains the newest item (2+2)
        let expectedResults = [
            4,  // 2+2
            6,  // 3+3
            8,  // 4+4
            10, // 5+5
            12, // 6+6
            14, // 7+7
            16, // 8+8
            18, // 9+9
            2,  // 1+1
            4   // 2+2
        ]
        
        for (index, expectedResult) in expectedResults.enumerated() {
            assertHistoryResult(at: index, equals: Decimal(expectedResult))
        }
    }
}
