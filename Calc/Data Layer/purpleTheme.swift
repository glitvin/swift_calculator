import Foundation
import UIKit

extension CalcViewController {
    
    var purpleTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#F4F5FA",
            extraTitleColor: "#1D1D1D",
            extraTitleFont:  UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#F4F5FA",
            operationFunctionTitleColor: "#7550FE",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#7550FE",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont:     UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#1D1D1D",
            displayColor: "#FFFFFF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
