import Foundation
import UIKit

//MARK: - UIImage
extension UIImage {
    struct keys {
        static let circleSlised = "CircleSliced"
        static let circle = "Circle"
    }
}

//MARK: - HistoryViewController
extension HistoryViewController {
    struct Constants {
        static let cellIdentifier = "EquationTableViewCell"
        static let numberOfSections = 1
    }
}

//MARK: - LCDDisplay
extension LCDDisplay {
    struct Constants {
        static let cornerRadius: CGFloat = 10
        static let previewBackgroundAlpha: CGFloat = 0.8
        static let menuTitle = ""
        
        struct MenuActions {
            static let copy = "Copy"
            static let paste = "Paste"
            static let history = "History"
        }
        
        struct Images {
            static let copy = "doc.on.doc"
            static let paste = "doc.on.clipboard"
            static let history = "clock"
        }
    }
}

//MARK: - Storyboard
extension UIStoryboard {
    struct Constants {
        static let mainStoryboard = "Main"
        static let historyViewController = "HistoryViewController"
    }
}

//MARK: - CalculatorHistory
extension CalculatorHistory {
    struct Constants {
        static let maxHistoryItems = 10
    }
}

//MARK: - MathInputController
extension MathInputController {
    struct Constants {
        static let defaultValue = "0"
        static let errorMessage = "Error"
        static let decimalPoint = "."
    }
}

//MARK: - ThemeManager
extension ThemeManager {
    struct Constants {
        static let dataStoreKey = "Calc.ThemeManager.ThemeIndex"
    }
}

//MARK: - CalculatorTheme
extension CalculatorTheme {
    struct Constants {
        static let buttonFont: CGFloat = 40
        static let displayFont: CGFloat = 100
        
        struct ThemeIds {
            static let bloodOrange = "1"
            static let darkBlue = "2"
            static let dark = "3"
            static let electro = "4"
            static let lightBlue = "5"
            static let light = "6"
            static let orange = "7"
            static let pink = "8"
            static let purple = "9"
            static let washedOut = "10"
        }
    }
}



