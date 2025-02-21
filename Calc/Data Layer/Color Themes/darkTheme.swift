import Foundation
import UIKit

extension ThemeManager {
    
    var darkTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.dark,
            extraFunctionColor: "#8E8E93",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#FF9500",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#FFFFFF",
            operationTitleSelectedColor: "#FF9500",
            
            pinpadColor: "#2C2C2E",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#000000",
            displayColor: "#FFFFFF",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
