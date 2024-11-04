import Foundation
import UIKit

extension CalcViewController {
    
    var darkTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#333333",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#000000",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#a6a6a6",
            pinpadTitleColor: "#000000",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#ff9f0a",
            displayColor: "#FFFFFF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
