
import Foundation
import UIKit

extension CalcViewController {
    
    var pinkTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#253C5B",
            extraTitleColor:  "#EBF0EF",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .semibold),
            
            operationFunctionColor: "#294666",
            operationFunctionTitleColor: "#EBF0EF",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            pinpadColor: "#FA569C",
            pinpadTitleColor: "#EBF0EF",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            backgroundColor: "#16253A",
            displayColor: "#EBF0EF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .regular)
        )
    }
}
