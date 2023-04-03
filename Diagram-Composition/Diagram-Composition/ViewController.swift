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
class FeedViewController: UIViewController {
    var loader: FeedLoader!
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadFeed { loadedItems in
            // update UI
            print(loadedItems)
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

struct Rechability {
    static let networkAvailable = false
}

/// This class composes the 2 concrete types
class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    // both concrete dependencies
    var remote: RemoteFeedLoader!
    var local: LocalFeedLoader!
    
    convenience init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.init()
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        
        let load = Rechability.networkAvailable ? remote.loadFeed : local.loadFeed
        load(completion)
    }
}

// using the objects
let vc = FeedViewController(loader: RemoteFeedLoader())
let vc2 = FeedViewController(loader: LocalFeedLoader())
// initialiser injection
let vc3 = FeedViewController(loader:
                                RemoteWithLocalFallbackFeedLoader(remote:
                                                                    RemoteFeedLoader(), local:
                                                                    LocalFeedLoader()))
