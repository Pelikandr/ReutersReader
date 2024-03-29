//
//  NameTableViewController.swift
//  ReutersReader
//
//  Created by Denis Zayakin on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class NameTableViewController: UITableViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    private lazy var dateFormatter = DateFormatter()

    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateDate), userInfo: nil, repeats: true)
        NotificationCenter.default.addObserver(forName: FeedDetailViewController.feedChoosedNotification, object: nil, queue: nil) { [unowned self] (notification: Notification) in
            if let title = notification.userInfo?["title"] as? String {
                self.titleLabel.text = title
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
        NotificationCenter.default.removeObserver(self, name: FeedDetailViewController.feedChoosedNotification, object: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    @objc func updateDate() {
        dateLabel.text = dateToString(from:Date())
    }

    private func dateToString(from date: Date) -> String {
        dateFormatter.dateFormat = "dd-MM-yy, HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}
