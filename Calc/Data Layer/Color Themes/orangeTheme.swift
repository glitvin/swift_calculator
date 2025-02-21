import Foundation
import UIKit

extension ThemeManager {
    
    var orangeTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.orange,
            extraFunctionColor: "#E57373",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#EF5350",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#D32F2F",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#F44336",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#E53935",
            displayColor: "#FFFFFF",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
