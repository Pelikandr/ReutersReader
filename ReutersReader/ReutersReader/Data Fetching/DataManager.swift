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
        if Reachability.isConnectedToNetwork(){
            return CloudDataSource()
        }else{
            return LocalDataSource()
        }
        
    }
}

