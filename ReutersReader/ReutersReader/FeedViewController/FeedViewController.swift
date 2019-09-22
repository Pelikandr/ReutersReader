//
//  FeedViewController.swift
//  ReutersReader
//
//  Created by Denis Zayakin on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

enum FeedViewControllerState {
    case business
    case entertainment
}


class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    private let adapter = FeedAdapter()
    private var state: FeedViewControllerState = .business {
        didSet {
            loadData() { [weak self] (data: [Section<Feed>]?, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data {
                    self?.adapter.data = data
                    self?.tableView.reloadData()
                } else {
                    print("No data error")
                }
            }
        }
    }

    private var choosedFeedItem: Feed?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 140
        tableView.delegate = adapter
        tableView.dataSource = adapter

        adapter.onNewsSelected = { [unowned self] (feed: Feed) in
            self.choosedFeedItem = feed
            self.performSegue(withIdentifier: "toFeedDetail", sender: nil)
        }

        state = .business
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FeedDetailViewController {
            (segue.destination as? FeedDetailViewController)?.feedItem = choosedFeedItem
            choosedFeedItem = nil
        }
    }

    @IBAction func onSwichState(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            state = .business
        case 1:
            state = .entertainment
        default:
            break
        }
    }

    private func loadData(_ completion: (([Section<Feed>]?, Error?) -> Void)?) {
        switch state {
        case .business:
            DataManager.shared.dataSource.getBusinessFeed { (data: [Feed]?, error: Error?) in
                var sections: [Section<Feed>]?
                if let data = data {
                    sections = [Section<Feed>(title: "Business", items: data)]
                }
                completion?(sections, error)
            }

        case .entertainment:
            DataManager.shared.dataSource.getEntertainmentAndEnvironmentFeed{ (data: [Feed]?, data2: [Feed]?, error: Error?) in
                var sections: [Section<Feed>]?
                if let data = data {
                    sections = [Section<Feed>(title: "Enterteinment", items: data)]
                    sections?.append(Section<Feed>(title: "Enviroment", items: data2!))
                }
                completion?(sections, error)
            }
        }
    }
}

