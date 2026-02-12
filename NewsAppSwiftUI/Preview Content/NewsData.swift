//
//  NewsData.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

class NewsData {
    
    static func loadNewsMock() -> ArticleList {
        
        // read the json file
        guard let path = Bundle.main.path(forResource: "news", ofType: "json") else {
            fatalError("Path for news.json was not found")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Unable to load data!")
        }
        
        guard let news = try? JSONDecoder().decode(ArticleList.self, from: data) else {
            fatalError("Unable to decode data!")
        }
    
        return news
    }
    
}
