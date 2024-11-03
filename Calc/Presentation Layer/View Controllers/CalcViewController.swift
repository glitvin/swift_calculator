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
    var currentTheme: CalculatorTheme {
        return CalculatorTheme(
            extraFunctionColor: "#a6a6a6",
            extraTitleColor: "#FFFFFF",
            extraTitleFont: UIFont.systemFont(ofSize: 40, weight: .bold),
            
            operationFunctionColor: "#ff9f0a",
            operationFunctionTitleColor: "#FFFFFF",
            operationFunctionTitleFont: UIFont.systemFont(ofSize: 40, weight: .medium),
            
            pinpadColor: "#333333",
            pinpadTitleColor: "#FFFFFF",
            pinpadTitleFont: UIFont.systemFont(ofSize: 40, weight: .regular),
            
            backgroundColor: "#000000",
            displayColor: "#FFFFFF",
            displayFont: UIFont.systemFont(ofSize: 100, weight: .semibold)
        )
    }

    // MARK: - Calculator Engine
    private var calculatoreEngine: CalculatorEngine = CalculatorEngine()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Decorate
    private func decorateView(){
                
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = UIColor (hex: currentTheme.displayColor)
        displayLabel.font = currentTheme.displayFont
        decorateButtons()
        
    }
    
    private func decorateButtons(){
        
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
    
    private func decorateButton(_ button: UIButton, _ usingSlicedImage: Bool = false){
        let image = usingSlicedImage ? UIImage(named: "CircleSliced.pdf") : UIImage(named: "Circle")
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .orange
        button.backgroundColor = .clear
    }
    
    private func decorateExtraFunctionButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraTitleColor), for: .normal)
        button.titleLabel?.font = currentTheme.extraTitleFont
    }
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.operationFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationFunctionTitleColor), for: .normal)
        button.titleLabel?.font = currentTheme.operationFunctionTitleFont
    }
    
    private func decoratePinPadButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        decorateButton(button, usingSlicedImage)
  
        button.tintColor = UIColor(hex: currentTheme.pinpadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinpadTitleColor), for: .normal)
        button.titleLabel?.font = currentTheme.pinpadTitleFont
    }
    // MARK: - IBActions
    
    @IBAction private func clearPressed() {
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
        calculatoreEngine.addPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func minusPressed() {
        calculatoreEngine.minusPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        calculatoreEngine.multiplyPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func dividePressed() {
        calculatoreEngine.dividePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func equalsPressed() {
        calculatoreEngine.equalsPressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        calculatoreEngine.decimalPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        let number = sender.tag
        calculatoreEngine.numberPressed(number)
        refreshLCDDisplay()
    }
    
    // MARK: - Refresh LCD Display
    private func refreshLCDDisplay() {
        displayLabel.text = calculatoreEngine.lcdDisplayText
    }
}


    


