import Foundation
import UIKit

extension ThemeManager {
    
    var purpleTheme: CalculatorTheme {
        return CalculatorTheme(id: "9",
            extraFunctionColor: "#FFFFFF",        
            extraTitleColor: "#121212",           
            extraTitleFont: 40,
            
            operationFunctionColor: "#F8F9FE",    
            operationFunctionTitleColor: "#6200EE", 
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#3700B3",     
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#6200EE",               
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#121212",            
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
