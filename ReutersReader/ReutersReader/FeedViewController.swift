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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 140
        tableView.delegate = adapter
        tableView.dataSource = adapter

        adapter.onNewsSelected = { (any: Any) in
            self.performSegue(withIdentifier: "toFeedDetail", sender: nil)
        }
    }


}

