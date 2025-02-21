import Foundation
import UIKit

extension ThemeManager {
    
    var purpleTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.purple,
            extraFunctionColor: "#FFFFFF",        
            extraTitleColor: "#121212",           
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#F8F9FE",    
            operationFunctionTitleColor: "#6200EE", 
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#3700B3",     
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#6200EE",               
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#121212",            
            displayColor: "#FFFFFF",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
