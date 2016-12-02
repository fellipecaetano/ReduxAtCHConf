import UIKit
import Redux

class SubredditsViewController: UITableViewController {
    private let cellReuseIdentifier = "SubredditTableViewCell"
    private var subreddits = ["ios", "apple", "iphone", "swift"]
    private var selectedSubreddit: String?
    private unowned let store: Store<AppState>
    private var unsubscribe: (() -> Void)?

    init(store: Store<AppState>) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Subreddits"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        // Trick to clear trailing cell separators
        tableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        unsubscribe = store.subscribe { [weak self] state in
            self?.render(subreddits: [], selectedSubreddit: state.selectedSubreddit)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        unsubscribe?()
    }

    private func render(subreddits: [String], selectedSubreddit: String?) {
        if let selectedSubreddit = selectedSubreddit, self.selectedSubreddit != selectedSubreddit {
            let posts = PostsViewController(subreddit: selectedSubreddit)
            navigationController?.pushViewController(posts, animated: true)
        }
        self.selectedSubreddit = selectedSubreddit
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subreddits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = subreddits[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSubreddit = subreddits[indexPath.row]
        store.dispatch(AppAction.selectSubreddit(selectedSubreddit))
    }
}
