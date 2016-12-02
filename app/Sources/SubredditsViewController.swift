import UIKit

class SubredditsViewController: UITableViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Subreddits"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
