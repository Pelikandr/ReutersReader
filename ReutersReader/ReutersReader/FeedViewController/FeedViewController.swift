//
//  FeedViewController.swift
//  ReutersReader
//
//  Created by Denis Zayakin on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private let adapter = FeedAdapter()

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

        DataManager.shared.dataSource.getBusinessFeed { [weak self] (data: [Feed]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                self?.adapter.data = [Section<Feed>(title: "Business", items: data)]
                self?.tableView.reloadData()
            } else {
                print("No data error")
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FeedDetailViewController {
            (segue.destination as? FeedDetailViewController)?.feedItem = choosedFeedItem
            choosedFeedItem = nil
        }
    }
}

