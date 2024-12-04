import Foundation
import UIKit

extension ThemeManager {
    
    var electroTheme: CalculatorTheme {
        return CalculatorTheme(id: "4",
            extraFunctionColor: "#0E0E41",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: 40,
            
            operationFunctionColor: "#14145C",
            operationFunctionTitleColor: "#4BE6A9",
            operationFunctionTitleFont: 40,
            operationSelectedColor:         "#70729D",
            operationTitleSelectedColor:    "#ffffff",
            
            pinpadColor: "#4BE6A9",
            pinpadTitleColor: "#14145C",
            pinpadTitleFont: 40,
            
            backgroundColor: "#14145C",
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
