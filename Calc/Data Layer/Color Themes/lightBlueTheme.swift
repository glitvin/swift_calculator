import Foundation
import UIKit

extension ThemeManager {
    
    var lightBlueTheme: CalculatorTheme {
        return CalculatorTheme(id: "5",
            extraFunctionColor: "#F0F4F8",
            extraTitleColor: "#1A1A1A",
            extraTitleFont: 40,
            
            operationFunctionColor: "#E3EEFF",
            operationFunctionTitleColor: "#0091EA",
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#2962FF",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#0091EA",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#F5F9FF",
            displayColor: "#1A1A1A",
            displayFont: 100
        )
    }
}
