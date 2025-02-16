import UIKit

class LCDDisplay: UIView {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addContextMenuInteraction()
    }
    
    private func addContextMenuInteraction() {
        let interaction = UIContextMenuInteraction(delegate: self)
        self.addInteraction(interaction)
        self.isUserInteractionEnabled = true
        self.backgroundColor = .clear
    }
}

// MARK: - UIContextMenuInteractionDelegate

extension LCDDisplay: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        guard let labelText = label.text, !labelText.isEmpty else { return nil }
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            UIMenu(title: "", children: [
                UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc")) { _ in
                    UIPasteboard.general.string = labelText
                },
                UIAction(title: "Paste", image: UIImage(systemName: "doc.on.clipboard")) { _ in
                    if let pastedText = UIPasteboard.general.string {
                        self.label.text = pastedText
                    }
                },
                UIAction(title: "History", image: UIImage(systemName: "clock")) { _ in
                    self.showHistory()
                }
            ])
        }
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        let previewView = UIView(frame: self.bounds)
        previewView.backgroundColor = .black.withAlphaComponent(0.8)
        previewView.layer.cornerRadius = 10
        
        let previewLabel = UILabel(frame: label.frame)
        previewLabel.text = label.text
        previewLabel.font = label.font
        previewLabel.textColor = label.textColor
        previewLabel.textAlignment = label.textAlignment
        previewView.addSubview(previewLabel)
        
        let parameters = UIPreviewParameters()
        parameters.backgroundColor = .clear
        return UITargetedPreview(view: self, parameters: parameters)
    }
    
    private func showHistory() {
        if let parentVC = findViewController() as? CalcViewController {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let historyVC = storyboard.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
                historyVC.datasource = parentVC.calculatorEngine.getHistory() 
                parentVC.present(historyVC, animated: true, completion: nil)
            }
        }
    }
}

// MARK: - Extension for finding ViewController

extension UIView {
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            responder = nextResponder
        }
        return nil
    }
}
