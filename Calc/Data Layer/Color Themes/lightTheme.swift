import Foundation
import UIKit

extension ThemeManager {
    
    var lightTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.light,
            extraFunctionColor: "#E5E5EA",
            extraTitleColor: "#1C1C1E",
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#F2F2F7",
            operationFunctionTitleColor: "#30D158",
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#5856D6",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#30D158",
            pinpadTitleColor: "#000000",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#F2F2F7",
            displayColor: "#000000",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
