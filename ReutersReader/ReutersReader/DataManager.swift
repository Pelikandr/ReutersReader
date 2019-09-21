//
//  DataManager.swift
//  ReutersReader
//
//  Created by Maria Holubieva on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

class DataManager {
    static var shared = DataManager()

    var dataSource: DataSource {
        //TODO: add check for Internet connection. If there is no Internet connection - use LocalDataSource instead
        return CloudDataSource()
    }
}
