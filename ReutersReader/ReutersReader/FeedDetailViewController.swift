//
//  FeedDetail.swift
//  ReutersReader
//
//  Created by Maria Holubieva on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    var feedItem: Feed?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = feedItem?.title
        descriptionTextView.text = feedItem?.description
    }
}
