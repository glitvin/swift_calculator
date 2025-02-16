import Foundation
import UIKit

extension ThemeManager {
    
    var pinkTheme: CalculatorTheme {
        return CalculatorTheme(id: "8",
            extraFunctionColor: "#1E325C",       
            extraTitleColor: "#FFFFFF",
            extraTitleFont: 40,
            
            operationFunctionColor: "#234B82",   
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: 40,
            operationSelectedColor: "#0D7AFF",    
            operationTitleSelectedColor: "#FFFFFF",
            
            pinpadColor: "#FF4081",              
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: 40,
            
            backgroundColor: "#0A192F",          
            displayColor: "#FFFFFF",
            displayFont: 100
        )
    }
}
