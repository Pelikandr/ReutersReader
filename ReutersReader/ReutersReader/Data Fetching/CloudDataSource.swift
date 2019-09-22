//
//  CloudDataSource.swift
//  ReutersReader
//
//  Created by Maria Holubieva on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

class CloudDataSource: DataSource {

    
    func getBusinessFeed(_ completion: (([Feed]?, Error?) -> Void)?) {
        DispatchQueue.global(qos: .background).async {
            let url = URL(string: "http://feeds.reuters.com/reuters/businessNews.xml")
            
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        completion?(nil, error)
                    }
                    return
                }
                
                let parser = DataParser()
                parser.parse(data, completion: { (feed: [Feed]) in
                    DispatchQueue.main.async {
                        completion?(feed, nil)
                    }
                })
            }
            task.resume()
        }
    }
    
    func getEnterteinmentFeed(_ completion: (([Feed]?, Error?) -> Void)?) {
        DispatchQueue.global(qos: .background).async {
            let url = URL(string: "http://feeds.reuters.com/reuters/entertainment.xml")
            
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        completion?(nil, error)
                    }
                    return
                }
                
                let parser = DataParser()
                parser.parse(data, completion: { (feed: [Feed]) in
                    DispatchQueue.main.async {
                        completion?(feed, nil)
                    }
                })
            }
            task.resume()
        }
    }
    
    func getEnvironmentFeed(_ completion: (([Feed]?, Error?) -> Void)?) {
        DispatchQueue.global(qos: .background).async {
            let url = URL(string: "http://feeds.reuters.com/reuters/environment.xml")
            
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        completion?(nil, error)
                    }
                    return
                }
                
                let parser = DataParser()
                parser.parse(data, completion: { (feed: [Feed]) in
                    DispatchQueue.main.async {
                        completion?(feed, nil)
                    }
                })
            }
            task.resume()
        }
    }
    
}
