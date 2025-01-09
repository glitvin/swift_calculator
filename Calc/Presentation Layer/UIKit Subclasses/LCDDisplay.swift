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
                }
            ])
        }
    }

    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        return nil
    }

    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForDismissingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        return nil
    }
}
