import Foundation
import UIKit


extension ThemeManager {
    
    var darkBlueTheme: CalculatorTheme {
        return CalculatorTheme(id: "2",
                               
            extraFunctionColor: "#1D1D1D",
            extraTitleColor: "#727272",
            extraTitleFont: 40,
            
            operationFunctionColor: "#323232",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: 40,
                               
            pinpadColor: "#4566B6",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#1D1D1D",
            displayColor: "#767676",
            displayFont: 100
        )
        
    }
    
}
