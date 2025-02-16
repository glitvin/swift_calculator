import Foundation
import UIKit

extension ThemeManager {
    
    var orangeTheme: CalculatorTheme {
        return CalculatorTheme( id: "7",
                                
            extraFunctionColor: "#E57373",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: 40,
            
            operationFunctionColor: "#EF5350",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#D32F2F",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#F44336",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#E53935",
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
