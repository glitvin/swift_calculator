import Foundation
import UIKit

extension ThemeManager {
    
    var pinkTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.pink,
            extraFunctionColor: "#1E325C",       
            extraTitleColor: "#FFFFFF",
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#234B82",   
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#0D7AFF",    
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#FF4081",              
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#0A192F",          
            displayColor: "#FFFFFF",
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
