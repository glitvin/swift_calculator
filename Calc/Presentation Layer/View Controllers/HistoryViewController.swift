import UIKit

class HistoryViewController: UITableViewController {
    
    // MARK: - Datasource
    var datasource: [MathEquation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        decorateView()
    }
    // MARK: - Navigation bar
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonPressed))
    }
                                                            
    @objc private func doneButtonPressed() {
        dismiss(animated: true , completion: nil)
    }
    
    // MARK: - Table View data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? EquationTableViewCell else {
            return UITableViewCell()
        }
        
        let equation = datasource[indexPath.row]
        cell.configure(with: equation)
        cell.selectedBackgroundView = UIView()
        decorateCell(cell)
        
        return cell
    }
    
    //MARK: - Decorate
    
    private func decorateCell(_ cell: EquationTableViewCell) {
        
        let theme = ThemeManager.shared.currentTheme
        cell.backgroundColor = UIColor(hex: theme.backgroundColor)
        cell.selectedBackgroundView?.backgroundColor = UIColor(hex: theme.operationFunctionColor)
        cell.lhsLabel.textColor = UIColor(hex: theme.displayColor)
        cell.rhsLabel.textColor = UIColor(hex: theme.displayColor)
        cell.resultLabel.textColor = UIColor(hex: theme.displayColor)
        cell.lhsLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.rhsLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.resultLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        
    }
    
    private func decorateView() {
        let theme = ThemeManager.shared.currentTheme
        tableView.backgroundColor = UIColor(hex: theme.backgroundColor)
        tableView.tintColor = UIColor(hex: theme.displayColor)
        navigationController?.navigationBar.tintColor = UIColor(hex: theme.displayColor)
        navigationController?.navigationBar.barTintColor = UIColor(hex: theme.backgroundColor)
    }
    
}
