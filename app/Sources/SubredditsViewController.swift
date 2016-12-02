import UIKit

class SubredditsViewController: UITableViewController {
    private let cellReuseIdentifier = "SubredditTableViewCell"
    private let subreddits = ["ios", "apple", "iphone", "swift"]

    init() {
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subreddits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = subreddits[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let posts = PostsViewController(subreddit: subreddits[indexPath.row])
        navigationController?.pushViewController(posts, animated: true)
    }
}
