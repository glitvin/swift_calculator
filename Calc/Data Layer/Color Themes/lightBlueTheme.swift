import Foundation
import UIKit

extension ThemeManager {
    
    var lightBlueTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.lightBlue,
            extraFunctionColor: "#F0F4F8",
            extraTitleColor: "#1A1A1A",
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#E3EEFF",
            operationFunctionTitleColor: "#0091EA",
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#2962FF",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#0091EA",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#F5F9FF",
            displayColor: "#1A1A1A",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
