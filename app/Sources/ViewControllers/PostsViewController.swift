import UIKit
import Redux

class PostsViewController: UITableViewController {
    private let subreddit: String
    private var posts = [Post]()
    private var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    init(subreddit: String) {
        self.subreddit = subreddit
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = subreddit
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44 // default row height
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.backgroundView = activityIndicator
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath)
        guard let typedCell = cell as? PostTableViewCell else {
            fatalError("Expected cell of type \(PostTableViewCell.self) but got \(type(of: cell))")
        }
        typedCell.render(post: posts[indexPath.row])
        return typedCell
    }
}
