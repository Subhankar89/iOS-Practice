//
//  ExtendingProb.swift
//  Singleton
//
//  Created by Subhankar Acharya on 01/04/2023.
//

import UIKit

// MARK: here we are extending the problem

 /// continued from ViewController
struct LoggedInUser {}
struct FeedItems {}

class APIClient {
    static let shared = APIClient()
    
    func login(completion: (LoggedInUser) -> Void) {}
    func loadFeed(completion: ([FeedItems]) -> Void) {}
}

class MockAPIClient: APIClient {}

class LoginViewController: UIViewController {
    /// property injection to replace it during test
    var api = APIClient.shared
    func didTapLoginButton() {
        api.login() { user in
            //some screen
        }
    }
}

class FeedViewController: UIViewController {
    
    var api = APIClient.shared
    
    override func viewDidLoad() {
        api.loadFeed { loadFeedItems in
            // update UI
        }
    }
}
