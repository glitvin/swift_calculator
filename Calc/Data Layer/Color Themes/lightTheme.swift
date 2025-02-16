import Foundation
import UIKit

extension ThemeManager {
    
    var lightTheme: CalculatorTheme {
        return CalculatorTheme(id: "6",
            extraFunctionColor: "#E5E5EA",
            extraTitleColor: "#1C1C1E",
            extraTitleFont: 40,
            
            operationFunctionColor: "#F2F2F7",
            operationFunctionTitleColor: "#30D158",
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#5856D6",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#30D158",
            pinpadTitleColor: "#000000",
            pinpadTitleFont: 40,
            
            backgroundColor: "#F2F2F7",
            displayColor: "#000000",
            displayFont: 100
        )
    }
}
