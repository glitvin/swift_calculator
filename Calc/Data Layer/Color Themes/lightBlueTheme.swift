import Foundation
import UIKit

extension CalcViewController {
    
    var lightBlueTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#F8F8F8",
            extraTitleColor: "#000000",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#D6DEE5",
            operationFunctionTitleColor: "#00B4FF",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            pinpadColor: "#00B4FF",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#EEEEEE",
            displayColor: "#000000",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
