import UIKit

class PostsViewController: UITableViewController {
    let posts = [
        "Redux Fundamentals Part 2: Single Source of Truth",
        "On updating parent component state, my child component constructor does not get called and child component state stays the same as before update",
        "React Redux question regarding transition between two Components with the same Model",
        "Wanna make calendar graph of contributions like on github? Use Chartify - Lightweight and customizable React.js chart component",
        "React.JS Top 10 Articles in November"
    ]

    init(subreddit: String) {
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
