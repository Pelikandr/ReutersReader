//
//  FeedDetail.swift
//  ReutersReader
//
//  Created by Maria Holubieva on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {
    static let feedChoosedNotification = NSNotification.Name(rawValue: "feedChoosedNotification")
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var feedItem: Feed?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = feedItem?.title
        descriptionTextView.text = feedItem?.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: FeedDetailViewController.feedChoosedNotification, object: nil, userInfo: ["title": feedItem?.title ?? ""])
    }
}
