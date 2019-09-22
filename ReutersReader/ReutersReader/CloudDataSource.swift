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
    
    func getEntertainmentAndEnvironmentFeed(_ completion: (([Feed]?, [Feed]?,  Error?) -> Void)?) {
        let enterteinmentQueue = DispatchQueue.global(qos: .background)
        let environmentQueue = DispatchQueue.global(qos: .background)
        let dispatchGroup = DispatchGroup()
        
        var entertainmentFeed: [Feed]?
        
        enterteinmentQueue.async(group: dispatchGroup) {
            let url = URL(string: "http://feeds.reuters.com/reuters/entertainment.xml")
            
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        completion?(nil, nil, error)
                    }
                    return
                }
                
                let parser = DataParser()
                parser.parse(data, completion: { (feed: [Feed]) in
                    entertainmentFeed = feed
                })
            }
            task.resume()
        }
        
        environmentQueue.async(group: dispatchGroup) {
            let url = URL(string: "http://feeds.reuters.com/reuters/environment.xml")
            
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        completion?(nil, nil, error)
                    }
                    return
                }
                
                let parser = DataParser()
                parser.parse(data, completion: { (feed: [Feed]) in
                    DispatchQueue.main.async {
                        completion?(entertainmentFeed, feed, nil)
                    }
                })
            }
            task.resume()
        }
    }
}
