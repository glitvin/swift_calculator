import Foundation
import UIKit

extension CalcViewController {
    
    var washedOutTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#ECF5FF",
            extraTitleColor: "#0D2A4B",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#A3CFF9",
            operationFunctionTitleColor: "#5487BA",
            operationFunctionTitleFont:UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#A3CFF9",
            pinpadTitleColor: "#5487BA",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#1D1D1D",
            displayColor:"#FFFFFF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
