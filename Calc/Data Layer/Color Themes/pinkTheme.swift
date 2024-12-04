
import Foundation
import UIKit

extension ThemeManager {
    
    var pinkTheme: CalculatorTheme {
        return CalculatorTheme( id: "8",
            extraFunctionColor: "#253C5B",
            extraTitleColor:  "#EBF0EF",
            extraTitleFont: 40,
            
            operationFunctionColor: "#294666",
            operationFunctionTitleColor: "#EBF0EF",
            operationFunctionTitleFont: 40,
            operationSelectedColor:         "#0265FF",
            operationTitleSelectedColor:    "#ffffff",
            
            pinpadColor: "#FA569C",
            pinpadTitleColor: "#EBF0EF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#16253A",
            displayColor: "#EBF0EF",
            displayFont: 100
        )
    }
}
