import Foundation

class SubredditsService {
    private static let subreddits = ["apple", "swift", "ios", "iphone"]

    func fetch(completion: @escaping ([String]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            completion(SubredditsService.subreddits)
        }
    }
}
