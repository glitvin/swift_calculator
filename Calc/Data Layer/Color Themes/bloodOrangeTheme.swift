import Foundation
import UIKit


extension ThemeManager {
    
    var bloodOrangeTheme: CalculatorTheme {
        return CalculatorTheme(id: "1",
            
            extraFunctionColor: "#3A0D31",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: 40,
            
            operationFunctionColor: "#B32672",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#CC1177",
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#A13872",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#E54771",
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
