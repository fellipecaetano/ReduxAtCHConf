import Redux

struct AppState {
    let subreddits: [String]
    let selectedSubreddit: String?
    let postsBySubreddit: [String: String]

    init (subreddits: [String] = [],
          selectedSubreddit: String? = nil,
          postsBySubreddit: [String: String] = [:]) {
        self.subreddits = subreddits
        self.selectedSubreddit = selectedSubreddit
        self.postsBySubreddit = postsBySubreddit
    }
}

enum AppAction: Redux.Action {
    case receiveSubreddits([String])
    case selectSubreddit(String)
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
