import Foundation
import UIKit

extension ThemeManager {
    
    var washedOutTheme: CalculatorTheme {
        return CalculatorTheme(id: CalculatorTheme.Constants.ThemeIds.washedOut,
            extraFunctionColor: "#E3F2FF",        
            extraTitleColor: "#001B3D",             
            extraTitleFont: CalculatorTheme.Constants.buttonFont,
            
            operationFunctionColor: "#90CAF9",    
            operationFunctionTitleColor: "#1565C0", 
            operationFunctionTitleFont: CalculatorTheme.Constants.buttonFont,
            operationSelectedColor: "#0D47A1",     
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#90CAF9",               
            pinpadTitleColor: "#1565C0",         
            pinpadTitleFont: CalculatorTheme.Constants.buttonFont,
            
            backgroundColor: "#121212",            
            displayColor: "#FFFFFF",               
            displayFont: CalculatorTheme.Constants.displayFont
        )
    }
}
