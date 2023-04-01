//
//  Code+Diagram.swift
//  Singleton
//
//  Created by Subhankar Acharya on 01/04/2023.
//
import UIKit

// MARK: API client module

class APIClient {
    static let shared = APIClient()
    private init() {}
    func execute(_ : URLRequest, completion: (Data) -> Void) {}
}

// MARK: Login module

struct LoggedInUser {
    let name: String
}

class LoginViewController: UIViewController {
    // closure where you invoked with a closure callback
    var login: (((LoggedInUser) -> Void) -> Void)?

    func didTapLoginButton() {
        login? { user in
            
        }
    }
}

// MARK: Main Module

class LoginClientAdapter {
    func login(completion: (LoggedInUser) -> Void) {
        let apiClient = APIClient.shared
        apiClient.login { user in
            completion(user)
        }
    }
}

extension APIClient {
    // inside this, we will call the generic execute method from APIClient
    func login(completion: (LoggedInUser) -> Void) {
        //execute(URL(string: ""), completion: (Data) -> Void)
    }
}

