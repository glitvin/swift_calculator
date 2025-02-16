import Foundation
import UIKit


extension ThemeManager {
    
    var darkBlueTheme: CalculatorTheme {
        return CalculatorTheme(id: "2",
            extraFunctionColor: "#1A1A1A",
            extraTitleColor: "#A0A0A0",
            extraTitleFont: 40,
            
            operationFunctionColor: "#2A2A2A",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#4B7BDA",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#4B7BDA",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#1A1A1A",
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
    
}
