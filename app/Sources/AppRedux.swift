import Redux

struct AppState {
    let selectedSubreddit: String?
    let postsBySubreddit: [String: String]

    init (selectedSubreddit: String? = nil,
          postsBySubreddit: [String: String] = [:]) {
        self.selectedSubreddit = selectedSubreddit
        self.postsBySubreddit = postsBySubreddit
    }
}

enum AppAction: Redux.Action {
    case selectSubreddit(String)
}

func AppReducer(state: AppState, action: Action) -> AppState {
    switch action {
    case AppAction.selectSubreddit(let selectedSubreddit):
        return AppState(selectedSubreddit: selectedSubreddit, postsBySubreddit: state.postsBySubreddit)
    default:
        return state
    }
}
