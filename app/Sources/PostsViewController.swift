import UIKit
import Redux

class PostsViewController: UITableViewController {
    private let subreddit: String

    private let store: Store<AppState>
    private var unsubscribe: (() -> Void)?

    private var posts = [String]()

    init(subreddit: String, store: Store<AppState>) {
        self.subreddit = subreddit
        self.store = store
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = subreddit
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44 // default row height
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false

        store.dispatch(FetchPosts(subreddit: subreddit))
    }

    override func viewWillAppear(_ animated: Bool) {
        unsubscribe = store.subscribe { state in
            self.render(posts: state.postsBySubreddit[self.subreddit])
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        unsubscribe?()
    }

    private func render(posts: [String]?) {
        if let posts = posts {
            self.posts = posts
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath)
        guard let typedCell = cell as? PostTableViewCell else {
            fatalError("Expected cell of type \(PostTableViewCell.self) but got \(type(of: cell))")
        }
        typedCell.textLabel?.text = posts[indexPath.row]
        return typedCell
    }
}
