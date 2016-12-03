import Foundation

class PostsService {
    private static let postsBySubreddit = [
        "apple": [
            Post(title: "Wallpaper Wednesday [November 30]"),
            Post(title: "Free Talk Friday - Casual Friday Discussions"),
            Post(title: "Apple VP of Special Projects Paul Deneve Removed From Leadership Webpage"),
            Post(title: "Apple VP of Special Projects Paul Deneve Removed From Leadership Webpage"),
            Post(title: "PSA: you can now look up your iPhone 6s's serial number to see if it is in the battery replacement program launched by Apple")
        ],
        "swift": [
            Post(title: "What's everyone working on? (November 2016)"),
            Post(title: "make container view resize as child view resizes"),
            Post(title: "Is there a way to access the tvOS's RF? The Apple TV remote users RF and wanted to know if there is an library for it."),
            Post(title: "Can't figure out this index out of range issue"),
            Post(title: "How do I parse the contents of a txt file into an array of Strings?")
        ],
        "ios": [
            Post(title: "Copy and paste trick could unlock iOS 10 devices in Lost Mode"),
            Post(title: "Couple of questions after moving from Android to iOS"),
            Post(title: "[ios10]Any free applications to use airplay[mirror phone screen] on my windows 10 laptop?"),
            Post(title: "How to install Spotify premium for free iOS 10"),
            Post(title: "News app refuses to \"read story now\" \"save for later\" or \"share\" when accessed from Notification Center.")
        ],
        "iphone": [
            Post(title: "New App Discovery Thread for December 02, 2016"),
            Post(title: "I have yet to see an app make use of this before and add a description of why they use background information. I wish more would do it."),
            Post(title: "Presenting... the iPhone 7 survival kit. Jaybird X3, dongle, Bluetooth receiver, and $2 Amazon clamshell case for it all."),
            Post(title: "X3, dongle, Bluetooth receiver, and $2 Amazon clamshell case for it all."),
            Post(title: "New iOS lockscreen bypass renders Activation Lock useless")
        ]
    ]
    
    private let subreddit: String

    init (subreddit: String) {
        self.subreddit = subreddit
    }

    func fetch(completion: @escaping ([Post]) -> Void) {
        if let postsForSubreddit = PostsService.postsBySubreddit[subreddit] {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                completion(postsForSubreddit)
            }
        } else {
            completion([])
        }
    }
}
