import Foundation
import UIKit

extension ThemeManager {
    
    var purpleTheme: CalculatorTheme {
        return CalculatorTheme( id: "9",
                                
            extraFunctionColor: "#F4F5FA",
            extraTitleColor: "#1D1D1D",
            extraTitleFont:  40,
            
            operationFunctionColor: "#F4F5FA",
            operationFunctionTitleColor: "#7550FE",
            operationFunctionTitleFont: 40,
            
            pinpadColor: "#7550FE",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont:   40,
            
            backgroundColor: "#1D1D1D",
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
