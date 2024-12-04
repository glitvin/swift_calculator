import Foundation
import UIKit

struct CalculatorTheme: Codable {
    let id: String
    
    let extraFunctionColor: String
    let extraTitleColor: String
    let extraTitleFont: CGFloat
    
    let operationFunctionColor: String
    let operationFunctionTitleColor: String
    let operationFunctionTitleFont: CGFloat
    let operationSelectedColor: String
    let operationTitleSelectedColor: String
    
    let pinpadColor: String
    let pinpadTitleColor: String
    let pinpadTitleFont: CGFloat
    
    let backgroundColor: String
    let displayColor: String
    let displayFont: CGFloat
    
}
