import Foundation
import UIKit

extension ThemeManager {
    
    var washedOutTheme: CalculatorTheme {
        return CalculatorTheme(id: "10",
            extraFunctionColor: "#E3F2FF",        
            extraTitleColor: "#001B3D",             
            extraTitleFont: 40,
            
            operationFunctionColor: "#90CAF9",    
            operationFunctionTitleColor: "#1565C0", 
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#0D47A1",     
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#90CAF9",               
            pinpadTitleColor: "#1565C0",         
            pinpadTitleFont: 40,
            
            backgroundColor: "#121212",            
            displayColor: "#FFFFFF",               
            displayFont: 100
        )
    }
}
