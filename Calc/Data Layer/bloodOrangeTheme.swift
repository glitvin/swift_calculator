import Foundation
import UIKit


extension CalcViewController {
    
    var bloodOrangeTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#4A1D41",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#9C3766",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#8D3362",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#C64661",
            displayColor: "#FFFFFF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
