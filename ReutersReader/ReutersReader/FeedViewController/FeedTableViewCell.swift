//
//  FeedTableViewCell.swift
//  ReutersReader
//
//  Created by Maria Holubieva on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesctiption: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        labelTitle.text = nil
        labelDesctiption.text = nil
    }
}
