import Foundation
import UIKit

extension ThemeManager {
    
    var darkTheme: CalculatorTheme {
        return CalculatorTheme(id: "3",
                               
            extraFunctionColor: "#a6a6a6",
            extraTitleColor: "#000000",
            extraTitleFont: 40,
            
            operationFunctionColor: "#ff9f0a",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: 40,
            operationSelectedColor:         "#ffffff",
            operationTitleSelectedColor:    "#ff9f0a",
            
            pinpadColor: "#333333",
            pinpadTitleColor: "#FFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#000000",
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
