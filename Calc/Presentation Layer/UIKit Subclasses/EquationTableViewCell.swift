import UIKit

class EquationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lhsLabel: UILabel!
    @IBOutlet weak var rhsLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    func configure(with equation: MathEquation) {
        lhsLabel.text = equation.lhs.formatted()
        rhsLabel.text = equation.generateStringRepresentationOfOperation() + " " + (equation.rhs?.formatted() ?? "")
        resultLabel.text = "= " + (equation.result?.formatted() ?? "")
    
    }
}


