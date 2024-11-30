import Foundation
import UIKit

extension ThemeManager {
    
    var orangeTheme: CalculatorTheme {
        return CalculatorTheme( id: "7",
                                
            extraFunctionColor: "#DC6969",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: 40,
            
            operationFunctionColor: "#D05353",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: 40,
            
            pinpadColor: "#CC4D4D",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#C94848",
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
