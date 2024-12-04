import UIKit


class CalcViewController: UIViewController {
    
    //MARK: - IBOutlets

    //LCD Display
    @IBOutlet var lcdDisplay: UIView!
    @IBOutlet var displayLabel: UILabel!
    
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
    @IBOutlet var devideButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var equalsButton: UIButton!
    
    // MARK: - Color Themes
    private var currentTheme: CalculatorTheme {
        return ThemeManager.shared.currentTheme
    }

    // MARK: - Calculator Engine
    private var calculatoreEngine: CalculatorEngine = CalculatorEngine()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addThemeGestureRecogniser()
        redecorateView()
        
    }
    
    // MARK: - Gestures
    
    private func addThemeGestureRecogniser() {
        let themeGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.themeGestureRecogniserDidTap(_:)))
        themeGestureRecogniser.numberOfTapsRequired = 2
        lcdDisplay.addGestureRecognizer(themeGestureRecogniser)
    }
                                                                                     
    @objc private func themeGestureRecogniserDidTap(_ gesture: UITapGestureRecognizer) {
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
        displayLabel.textColor = UIColor (hex: currentTheme.displayColor)
        displayLabel.font = UIFont.systemFont(ofSize: currentTheme.displayFont, weight: .regular)
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
        decorateOperationButton(devideButton)
        decorateOperationButton(multiplyButton)
        decorateOperationButton(minusButton)
        decorateOperationButton(plusButton)
        decorateOperationButton(equalsButton)
    }
    
    private func decorateButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        let image = usingSlicedImage ? UIImage(named: "CircleSliced.pdf") : UIImage(named: "Circle")
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
        
    }
    
    private func decoratePinPadButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        decorateButton(button, usingSlicedImage)
  
        button.tintColor = UIColor(hex: currentTheme.pinpadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinpadTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: currentTheme.pinpadTitleFont, weight: .regular)
    }

    // MARK: - Select Operation Buttons
    
    private func deselectOperationButtons() {
        selectOperationButtons(devideButton, false)
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
        deselectOperationButtons()
        
        calculatoreEngine.clearPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func negatePressed() {
        calculatoreEngine.negatePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func percentagePressed() {
        calculatoreEngine.percentagePressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Operations
    
    @IBAction private func addPressed() {
        deselectOperationButtons()
        selectOperationButtons(plusButton, true)
        
        calculatoreEngine.addPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func minusPressed() {
        deselectOperationButtons()
        selectOperationButtons(minusButton, true)
        
        
        calculatoreEngine.minusPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        deselectOperationButtons()
        selectOperationButtons(multiplyButton, true)
        
        calculatoreEngine.multiplyPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func dividePressed() {
        deselectOperationButtons()
        selectOperationButtons(devideButton, true)
        
        calculatoreEngine.dividePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func equalsPressed() {
        deselectOperationButtons()
        
        calculatoreEngine.equalsPressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        deselectOperationButtons()
        
        calculatoreEngine.decimalPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        deselectOperationButtons()
        
        let number = sender.tag
        calculatoreEngine.numberPressed(number)
        refreshLCDDisplay()
    }
    
    // MARK: - Refresh LCD Display
    private func refreshLCDDisplay() {
        displayLabel.text = calculatoreEngine.lcdDisplayText
    }
}


    


