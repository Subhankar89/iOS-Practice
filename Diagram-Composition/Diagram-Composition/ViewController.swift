//
//  ViewController.swift
//  Diagram-Composition
//
//  Created by Subhankar Acharya on 03/04/2023.
//

import UIKit

protocol FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void)
}

struct Rechability {
    static let networkAvailable = false
}

class FeedViewController: UIViewController {
    // both concrete dependencies
    var remote: RemoteFeedLoader!
    var local: LocalFeedLoader!
    
    convenience init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.init()
        self.remote = remote
        self.local = local
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Rechability.networkAvailable {
            remote.loadFeed { loadedItems in
                // do something
            }
        } else {
            local.loadFeed { loadedItems in
                // do something
            }
        }
    }
}

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // do something
        completion(["result1, result2"])
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // do something
        completion(["result3, result4"])
    }
}
