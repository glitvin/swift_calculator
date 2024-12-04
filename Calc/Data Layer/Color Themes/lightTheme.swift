import Foundation
import UIKit

extension ThemeManager {
    
    var lightTheme: CalculatorTheme {
        return CalculatorTheme( id: "6",
            extraFunctionColor: "#F6F8F9",
            extraTitleColor: "#000000",
            extraTitleFont: 40,
            
            operationFunctionColor: "#E9F0F4",
            operationFunctionTitleColor: "#4BE6A9",
            operationFunctionTitleFont: 40,
            operationSelectedColor:         "#70729D",
            operationTitleSelectedColor:    "#ffffff",
                                
            
            pinpadColor: "#4BE6A9",
            pinpadTitleColor: "#14145C",
            pinpadTitleFont: 40,
            
            backgroundColor: "#E9F0F4",
            displayColor: "#000000",
            displayFont: 100
        )
    }
}
