import Foundation
import UIKit


extension CalcViewController {
    
    var darkBlueTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#1D1D1D",
            extraTitleColor: "#727272",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#323232",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#4566B6",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#1D1D1D",
            displayColor: "#767676",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
