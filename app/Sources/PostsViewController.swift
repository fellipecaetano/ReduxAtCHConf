import UIKit

class PostsViewController: UITableViewController {
    init(subreddit: String) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = subreddit
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
