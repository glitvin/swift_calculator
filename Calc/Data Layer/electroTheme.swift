import Foundation
import UIKit

extension CalcViewController {
    
    var electroTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#0E0E41",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#14145C",
            operationFunctionTitleColor: "#4BE6A9",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#4BE6A9",
            pinpadTitleColor: "#14145C",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#14145C",
            displayColor: "#FFFFFF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
