//
//  FeedAdapter.swift
//  ReutersReader
//
//  Created by Denis Zayakin on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FeedAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    @IBAction func subTabControl(_ sender: Any) {
    }
    
    var onNewsSelected: ((Any) -> Void)?

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onNewsSelected?(indexPath.row)
    }

//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let nextVC = segue.destination as? FeedDetailViewController else { return }
//    }
}
