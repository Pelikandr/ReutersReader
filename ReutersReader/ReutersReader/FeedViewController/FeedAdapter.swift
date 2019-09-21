//
//  FeedAdapter.swift
//  ReutersReader
//
//  Created by Denis Zayakin on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

struct Section<Item> {
    let title: String
    let items: [Item]
}

class FeedAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {

    var data = [Section<Feed>]()
    var onNewsSelected: ((Feed) -> Void)?

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = data[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        cell.labelTitle.text = item.title
        cell.labelDesctiption.text = item.description
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.section].items[indexPath.row]
        onNewsSelected?(item)
    }
}
