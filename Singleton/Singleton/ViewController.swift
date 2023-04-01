//
//  ViewController.swift
//  Singleton
//
//  Created by Subhankar Acharya on 30/03/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//// MARK: general
//class APIClient {
//    private init() {}
//}
//
//let client = APIClient.init()

//// MARK: followed by book
//class APIClient {
//    private static let instance = APIClient()
//
//    static func getInstance() -> APIClient {
//        return instance
//    }
//
//    private init() {}
//}
//
//let client = APIClient.getInstance()

//// MARK: in swift
//
//class APIClient {
//    /// we cannot mutate it .. the type system already enforces this for us
//    static let instance = APIClient()
//
//    private init() {}
//}
//
///// guarantee that, we can have only one instance per application run
//let client = APIClient.instance

//// MARK: final class
//final class APIClient {
//    static let instance =  APIClient()
//
//    private init() {}
//}
//
///// can use extension to add more behavior but cannot override it
//
//extension APIClient {
//    func addMoreFun() {}
//}

//struct LoggedInUser {}
//// MARK: singleton with capital S
//final class APIClient {
//    static let instance =  APIClient()
//
//    private init() {}
//
//    func login(completion: (LoggedInUser) -> Void) {}
//}

/// singleton with small s .. which is a convinience
//URLSession()
//URLSession.shared

//class LoginViewController: UIViewController {
//    func didTapLoginButton() {
//        APIClient.shared.login { user in
//            // do something
//        }
//    }
//}

// MARK: mutable global state, not a singleton with capital s and not a singleton with small s

//class APIClient {
//    static var shared = APIClient()
//
//    private init() {}
//
//    func login(completion: (LoggedInUser) -> Void) {}
//}
//
//class MockAPIClient: APIClient {
//     init() { }
//}
//
//APIClient.shared = MockAPIClient()
//
//class LoginViewController: UIViewController {
//    func didTapLoginButton() {
//        APIClient.shared.login() { user in
//            // do something
//        }
//    }
//}

/// in above example we introduce global state for test target .. in setup
/// we need to setup the mock client .. in tear down .. we need to tear down
/// in this case what's the point in making APIclient private init() ??

// MARK: fixing the above problem .. back to lower case s singleton .. you still create your own instance and pass it along

//class APIClient {
//    // changing from var to let contains the global state
//    static let shared = APIClient()
//    func login(completion: (LoggedInUser) -> Void) {}
//}
//
//class MockAPIClient: APIClient {
//
//}
//
//let apiClient = APIClient()
//
//class LoginViewControllers: UIViewController {
//    func didTapLoginButton() {
//        APIClient.shared.login() { user in
//            // do something
//        }
//    }
//}

/// if we need to test the above approach, we would need a property and can use property injection 

//class LoginViewController: UIViewController {
//    /// property injection to replace it during test
//    var api = APIClient.shared
//    func didTapLoginButton() {
//        api.login() { user in
//            //some screen
//        }
//    }
//}



