import Foundation
import UIKit


extension ThemeManager {
    
    var darkBlueTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.darkBlue,
            extraFunctionColor: "#1A1A1A",
            extraTitleColor: "#A0A0A0",
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#2A2A2A",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#4B7BDA",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#4B7BDA",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#1A1A1A",
            displayColor: "#FFFFFF",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
    
}
