import Foundation
import UIKit

extension ThemeManager {
    
    var lightBlueTheme: CalculatorTheme {
        return CalculatorTheme(id: "5",
                               
            extraFunctionColor: "#F8F8F8",
            extraTitleColor: "#000000",
            extraTitleFont: 10,
            
            operationFunctionColor: "#D6DEE5",
            operationFunctionTitleColor: "#00B4FF",
            operationFunctionTitleFont: 40,
            
            pinpadColor: "#00B4FF",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#EEEEEE",
            displayColor: "#000000",
            displayFont: 100
        )
    }
}
