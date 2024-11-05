import Foundation
import UIKit

extension CalcViewController {
    
    var darkTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#a6a6a6",
            extraTitleColor: "#000000",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#ff9f0a",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#333333",
            pinpadTitleColor: "#FFFFF",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#000000",
            displayColor: "#FFFFFF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
