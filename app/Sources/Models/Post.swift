struct Post {
    let title: String

    init (title: String) {
        self.title = title
    }

    init? (attributes: [String: Any]) {
        guard let title = attributes["title"] as? String else {
            return nil
        }
        self.title = title
    }

    static func from(subreddit: [String: Any]) -> [Post] {
        guard let data = subreddit["data"] as? [String: Any],
            let children = data["children"] as? [[String: Any]] else {
                return []
        }
        return children
            .flatMap({ $0["data"] as? [String: Any] })
            .flatMap(Post.init)
    }
}
