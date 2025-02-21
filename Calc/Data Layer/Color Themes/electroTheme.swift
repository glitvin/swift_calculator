import Foundation
import UIKit

extension ThemeManager {
    
    var electroTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.electro,
            extraFunctionColor: "#1A1A3C",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#191970",
            operationFunctionTitleColor: "#00FF9D",
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#4B4BA5",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#00FF9D",
            pinpadTitleColor: "#191970",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#191970",
            displayColor: "#00FF9D",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
