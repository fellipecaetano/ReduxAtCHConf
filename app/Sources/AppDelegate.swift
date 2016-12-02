import UIKit
import Redux

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let store = Store(initialState: AppState(), reducer: AppReducer)

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = UINavigationController(
            rootViewController: SubredditsViewController(store: store)
        )
        self.window?.makeKeyAndVisible()
        return true
    }
}
