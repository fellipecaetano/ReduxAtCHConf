import Redux

struct AppState {
    let subreddits: [String]
    let selectedSubreddit: String?
    let postsBySubreddit: [String: [String]]

    init (subreddits: [String] = [],
          selectedSubreddit: String? = nil,
          postsBySubreddit: [String: [String]] = [:]) {
        self.subreddits = subreddits
        self.selectedSubreddit = selectedSubreddit
        self.postsBySubreddit = postsBySubreddit
    }
}

enum AppAction: Redux.Action {
    case receiveSubreddits([String])
    case selectSubreddit(String)
    case receivePosts(posts: [String], subreddit: String)
}

func AppReducer(state: AppState, action: Action) -> AppState {
    switch action {
    case AppAction.receiveSubreddits(let subreddits):
        return AppState(
            subreddits: subreddits,
            selectedSubreddit: state.selectedSubreddit,
            postsBySubreddit: state.postsBySubreddit
        )
    case AppAction.selectSubreddit(let selectedSubreddit):
        return AppState(
            subreddits: state.subreddits,
            selectedSubreddit: selectedSubreddit,
            postsBySubreddit: state.postsBySubreddit
        )
    case let AppAction.receivePosts(posts, subreddit):
        return AppState(
            subreddits: state.subreddits,
            selectedSubreddit: state.selectedSubreddit,
            postsBySubreddit: state.postsBySubreddit.merge(with: [subreddit: posts])
        )
    default:
        return state
    }
}

struct FetchSubreddits: Command {
    static let defaultSubreddits = ["ios", "apple", "iphone", "swift"]

    func run(state: () -> AppState, dispatch: @escaping (Action) -> Void) {
        let action = AppAction.receiveSubreddits(FetchSubreddits.defaultSubreddits)
        dispatch(action)
    }
}

struct FetchPosts: Command {
    private let subreddit: String
    private let session = URLSession.shared

    init (subreddit: String) {
        self.subreddit = subreddit
    }

    func run(state: () -> AppState, dispatch: @escaping (Action) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let subredditAttributes = json as? [String: Any] else {
                    return
            }
            let action = AppAction.receivePosts(
                posts: Post.from(subreddit: subredditAttributes).map({ $0.title }),
                subreddit: self.subreddit
            )
            DispatchQueue.main.async {
                dispatch(action)
            }
        }
        task.resume()
    }

    private var url: URL {
        return URL(string: "http://www.reddit.com/r/\(subreddit).json")!
    }
}
