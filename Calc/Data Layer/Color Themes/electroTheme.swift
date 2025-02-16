import Foundation
import UIKit

extension ThemeManager {
    
    var electroTheme: CalculatorTheme {
        return CalculatorTheme(id: "4",
            extraFunctionColor: "#1A1A3C",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: 40,
            
            operationFunctionColor: "#191970",
            operationFunctionTitleColor: "#00FF9D",
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#4B4BA5",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#00FF9D",
            pinpadTitleColor: "#191970",
            pinpadTitleFont: 40,
            
            backgroundColor: "#191970",
            displayColor: "#00FF9D",
            displayFont: 100
        )
    }
}
