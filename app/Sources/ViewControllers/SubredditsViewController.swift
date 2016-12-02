import UIKit
import Redux

class SubredditsViewController: UITableViewController {
    private let cellReuseIdentifier = "SubredditTableViewCell"
    private var subreddits = ["apple", "swift", "ios", "iphone"]

    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Subreddits"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
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
}
