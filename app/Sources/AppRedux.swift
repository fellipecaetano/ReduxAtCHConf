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
    static let defaultPosts = [
        "Redux Fundamentals Part 2: Single Source of Truth",
        "On updating parent component state, my child component constructor does not get called and child component state stays the same as before update",
        "React Redux question regarding transition between two Components with the same Model",
        "Wanna make calendar graph of contributions like on github? Use Chartify - Lightweight and customizable React.js chart component",
        "React.JS Top 10 Articles in November"
    ]

    private let subreddit: String

    init (subreddit: String) {
        self.subreddit = subreddit
    }

    func run(state: () -> AppState, dispatch: @escaping (Action) -> Void) {
        let action = AppAction.receivePosts(posts: FetchPosts.defaultPosts, subreddit: subreddit)
        dispatch(action)
    }
}
