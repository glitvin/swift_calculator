import Foundation
import UIKit

extension ThemeManager {
    
    var darkTheme: CalculatorTheme {
        return CalculatorTheme(id: "3",
                               
            extraFunctionColor: "#8E8E93",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: 40,
            
            operationFunctionColor: "#FF9500",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: 40,
            operationSelectedColor:         "#FFFFFF",
            operationTitleSelectedColor:    "#FF9500",
            
            pinpadColor: "#2C2C2E",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#000000",
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
