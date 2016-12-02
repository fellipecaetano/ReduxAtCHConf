import UIKit

class PostTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: PostTableViewCell.self)

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        selectionStyle = .none
        textLabel?.numberOfLines = 0
    }
}
