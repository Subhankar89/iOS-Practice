//
//  ViewController.swift
//  Diagram-Composition
//
//  Created by Subhankar Acharya on 03/04/2023.
//

import UIKit

// this could be a protocol as well
typealias FeedLoader = (([String]) -> Void) -> Void
class FeedViewController: UIViewController {
    var loadFeed: FeedLoader!
    
    convenience init(loadFeed: @escaping FeedLoader) {
        self.init()
        self.loadFeed = loadFeed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // invoke the loadFeed closure and expect to get some items
        loadFeed { loadedItems in
            //update UI
        }
    }
}
