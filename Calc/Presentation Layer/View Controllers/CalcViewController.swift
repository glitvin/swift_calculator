import UIKit

class CalcViewController: UIViewController, UIEditMenuInteractionDelegate {
    
    //MARK: - IBOutlets
    
    //LCD Display
    @IBOutlet var lcdDisplay: LCDDisplay!
    
    
    //Pin Pad Buttons
    @IBOutlet var pinpadButton0: UIButton!
    @IBOutlet var pinpadButton1: UIButton!
    @IBOutlet var pinpadButton2: UIButton!
    @IBOutlet var pinpadButton3: UIButton!
    @IBOutlet var pinpadButton4: UIButton!
    @IBOutlet var pinpadButton5: UIButton!
    @IBOutlet var pinpadButton6: UIButton!
    @IBOutlet var pinpadButton7: UIButton!
    @IBOutlet var pinpadButton8: UIButton!
    @IBOutlet var pinpadButton9: UIButton!
    @IBOutlet var decimalButton: UIButton!
    
    //Extra Function Buttons
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var negateButton: UIButton!
    @IBOutlet var percentageButton: UIButton!
    
    // Operations Buttons
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var equalsButton: UIButton!
    
    var needToDisplayWelcomeIntro = true
    
    // MARK: - Color Themes
    private var currentTheme: CalculatorTheme {
        return ThemeManager.shared.currentTheme
    }
    
    // MARK: - Calculator Engine
    var calculatorEngine: CalculatorEngine = CalculatorEngine()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        lcdDisplay.isUserInteractionEnabled = true
        addThemeGestureRecognizer()
        redecorateView()
        refreshLCDDisplay()
        preperForWelcomeIntro()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        if needToDisplayWelcomeIntro {
            needToDisplayWelcomeIntro = false
            dispayWelcomeIntro()
        }
    }
    
    private func preperForWelcomeIntro() {
        lcdDisplay.alpha = 0
    }
    
    private func dispayWelcomeIntro() {
        let didRestoreFromLastSession = calculatorEngine.restoreFromLastSession()
        refreshLCDDisplay()
        
        let timeDelay: TimeInterval = 0.25
        if didRestoreFromLastSession {
            slideInLCDDisplay(withDelay: timeDelay)
        } else {
            fadeInLCDDisplay(withDelay: timeDelay)
        }
    }
    
    private func fadeInLCDDisplay(withDelay delay: TimeInterval) {
        UIView.animate(withDuration: 1, delay: delay, options: .curveEaseOut) { [weak self] in 
            self?.lcdDisplay.alpha = 1
        } completion: { _ in
        }
    }
    
    private func slideInLCDDisplay(withDelay delay: TimeInterval) {
        lcdDisplay.transform = CGAffineTransform(translationX: 0, y: lcdDisplay.frame.height * 0.5)
        UIView.animate(withDuration: 0.35, delay: delay, options: .curveEaseOut) { [weak self] in 
            self?.lcdDisplay.alpha = 1
            self?.lcdDisplay.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { _ in
        }
    }
    
    // MARK: - Gestures
    
    private func addThemeGestureRecognizer() {
        let themeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.themeGestureRecognizerDidTap(_:)))
        themeGestureRecognizer.numberOfTapsRequired = 2
        lcdDisplay.isUserInteractionEnabled = true
        lcdDisplay.addGestureRecognizer(themeGestureRecognizer)
    }
    
    @objc private func themeGestureRecognizerDidTap(_ gesture: UITapGestureRecognizer) {
        decorateViewWithNextTheme()
    }
    
    // MARK: - Decorate
    
    private func decorateViewWithNextTheme() {
        ThemeManager.shared.moveToNextTheme()
        redecorateView()
    }
    
    private func redecorateView() {
        
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        lcdDisplay.backgroundColor = .clear
        lcdDisplay.label.textColor = UIColor (hex: currentTheme.displayColor)
        lcdDisplay.label.font = UIFont.systemFont(ofSize: currentTheme.displayFont, weight: .regular)
        decorateButtons()
        
    }
    
    private func decorateButtons() {
        
        //Pin Pad buttons
        decoratePinPadButton(pinpadButton0, true)
        decoratePinPadButton(pinpadButton1)
        decoratePinPadButton(pinpadButton2)
        decoratePinPadButton(pinpadButton3)
        decoratePinPadButton(pinpadButton4)
        decoratePinPadButton(pinpadButton5)
        decoratePinPadButton(pinpadButton6)
        decoratePinPadButton(pinpadButton7)
        decoratePinPadButton(pinpadButton8)
        decoratePinPadButton(pinpadButton9)
        decoratePinPadButton(decimalButton)
        
        //Extra Function Buttons
        decorateExtraFunctionButton(clearButton)
        decorateExtraFunctionButton(negateButton)
        decorateExtraFunctionButton(percentageButton)
        
        //Operations Buttons
        decorateOperationButton(divideButton)
        decorateOperationButton(multiplyButton)
        decorateOperationButton(minusButton)
        decorateOperationButton(plusButton)
        decorateOperationButton(equalsButton)
    }
    
    private func decorateButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        let image = usingSlicedImage ? UIImage(named: UIImage.keys.circleSlised) : UIImage(named: UIImage.keys.circle)
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .orange
        button.backgroundColor = .clear
    }
    
    private func decorateExtraFunctionButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: currentTheme.extraTitleFont, weight: .regular)
    }
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.operationFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationFunctionTitleColor), for: .normal)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleSelectedColor), for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: currentTheme.operationFunctionTitleFont, weight: .regular)
        
        if button.isSelected {
            selectOperationButtons(button, true)
        }
    }
    
    private func decoratePinPadButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        decorateButton(button, usingSlicedImage)
        
        button.tintColor = UIColor(hex: currentTheme.pinpadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinpadTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: currentTheme.pinpadTitleFont, weight: .regular)
    }
    
    // MARK: - Select Operation Buttons
    
    private func deselectOperationButtons() {
        selectOperationButtons(divideButton, false)
        selectOperationButtons(multiplyButton, false)
        selectOperationButtons(minusButton, false)
        selectOperationButtons(plusButton, false)
    }
    
    private func selectOperationButtons(_ button: UIButton, _ selected: Bool){
        button.tintColor = selected ? UIColor(hex: currentTheme.operationSelectedColor) : UIColor(hex: currentTheme.operationFunctionColor)
        button.isSelected = selected
    }
    
    
    // MARK: - IBActions
    
    @IBAction private func clearPressed() {
        clearButton.bounce()
        
        deselectOperationButtons()
        calculatorEngine.clearPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func negatePressed() {
        negateButton.bounce()
        
        calculatorEngine.negatePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func percentagePressed() {
        percentageButton.bounce()
        
        calculatorEngine.percentagePressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Operations
    
    @IBAction private func addPressed() {
        plusButton.bounce()
        
        deselectOperationButtons()
        selectOperationButtons(plusButton, true)
        
        calculatorEngine.handleOperation(.add)
        refreshLCDDisplay()
    }
    
    @IBAction private func minusPressed() {
        minusButton.bounce()
        
        deselectOperationButtons()
        selectOperationButtons(minusButton, true)
        
        calculatorEngine.handleOperation(.subtract)
        refreshLCDDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        multiplyButton.bounce()
        
        deselectOperationButtons()
        selectOperationButtons(multiplyButton, true)
        
        calculatorEngine.handleOperation(.multiply)
        refreshLCDDisplay()
    }
    
    @IBAction private func dividePressed() {
        divideButton.bounce()
        
        deselectOperationButtons()
        selectOperationButtons(divideButton, true)
        
        calculatorEngine.handleOperation(.divide)
        refreshLCDDisplay()
    }
    
    @IBAction private func equalsPressed() {
        equalsButton.bounce()
        
        deselectOperationButtons()
        
        calculatorEngine.equalsPressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        decimalButton.bounce()
        
        deselectOperationButtons()
        
        calculatorEngine.decimalPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        sender.bounce()
        
        deselectOperationButtons()
        
        let number = sender.tag
        calculatorEngine.pinPadPressed(number)
        refreshLCDDisplay()
    }
    
    // MARK: - Refresh LCD Display
    private func refreshLCDDisplay() {
        lcdDisplay.label.text = calculatorEngine.lcdDisplayText
    }

}
