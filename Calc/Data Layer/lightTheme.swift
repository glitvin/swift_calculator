import Foundation
import UIKit

extension CalcViewController {
    
    var lightTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#F6F8F9",
            extraTitleColor: "#000000",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#E9F0F4",
            operationFunctionTitleColor: "#4BE6A9",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#4BE6A9",
            pinpadTitleColor: "#14145C",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#E9F0F4",
            displayColor: "#000000",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
