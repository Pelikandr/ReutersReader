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
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateDate), userInfo: nil, repeats: true)

        //        let url = URL(string: "http://feeds.reuters.com/reuters/businessNews.xml")
//
//        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
//            guard let data = data, error == nil else {
//                print(error ?? "Unknown error")
//                return
//            }
//            let str = String(data: data, encoding: .utf8)
//            print(str)
//        }
//        task.resume()
//        print(task)
//        let parser = XMLParser(data: Data)
//        parser.delegate = self as! XMLParserDelegate
//        if parser.parse() {
//            print(self.results ?? "No results")
//        }

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
