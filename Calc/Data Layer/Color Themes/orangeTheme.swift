import Foundation
import UIKit

extension CalcViewController {
    
    var orangeTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#DC6969",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#D05353",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#CC4D4D",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#C94848",
            displayColor: "#FFFFFF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
