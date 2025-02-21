import Foundation
import UIKit


extension ThemeManager {
    
    var bloodOrangeTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.bloodOrange,
            
            extraFunctionColor: "#3A0D31",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#B32672",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#CC1177",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#A13872",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#E54771",
            displayColor: "#FFFFFF",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
