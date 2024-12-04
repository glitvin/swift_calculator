import Foundation
import UIKit

extension ThemeManager {
    
    var washedOutTheme: CalculatorTheme {
        return CalculatorTheme( id: "10",
                                
            extraFunctionColor: "#ECF5FF",
            extraTitleColor: "#0D2A4B",
            extraTitleFont: 40,
            
            operationFunctionColor: "#A3CFF9",
            operationFunctionTitleColor: "#5487BA",
            operationFunctionTitleFont: 40,
            operationSelectedColor:         "#0D2A4B",
            operationTitleSelectedColor:    "#ffffff",
            
            pinpadColor: "#A3CFF9",
            pinpadTitleColor: "#5487BA",
            pinpadTitleFont: 40,
            
            backgroundColor: "#1D1D1D",
            displayColor:"#FFFFFF",
            displayFont: 100
        )
    }
}
