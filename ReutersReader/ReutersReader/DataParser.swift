//
//  XMLParser.swift
//  ReutersReader
//
//  Created by Maria Holubieva on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

class XMLParser: NSObject, XMLParserDelegate {

    func parse(_ data: Data) {
        let parser = XMLParser()
        parser.delegate = self
        if parser.parse()
    }

    //MARK: - XMLParserDelegate


}
