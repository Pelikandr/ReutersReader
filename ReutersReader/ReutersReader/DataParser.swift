//
//  XMLParser.swift
//  ReutersReader
//
//  Created by Maria Holubieva on 21.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

class DataParser: NSObject, XMLParserDelegate {

    private var elementName: String?
    private var titleValue: String = ""
    private var descriptionValue: String = ""
    private var feedItems = [Feed]()
    private var completion: (([Feed]) -> Void)?

    func parse(_ data: Data, completion: (([Feed]) -> Void)?) {
        self.completion = completion
        feedItems.removeAll()

        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }

    //MARK: - XMLParserDelegate

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        if elementName == "item" {
            titleValue = String()
            descriptionValue = String()
        }

        self.elementName = elementName
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if let index = descriptionValue.range(of: "<div")?.lowerBound {
            let substring = descriptionValue[..<index]
            descriptionValue = String(substring)
        }
        if elementName == "item" {
            let feed = Feed(title: titleValue, description: descriptionValue)
            feedItems.append(feed)
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if (!data.isEmpty) {
            if self.elementName == "title" {
                titleValue += data
            } else if self.elementName == "description" {
                descriptionValue += data
            }
        }
    }

    func parserDidEndDocument(_ parser: XMLParser) {
        self.completion?(feedItems)
        completion = nil
        feedItems.removeAll()
    }
}
