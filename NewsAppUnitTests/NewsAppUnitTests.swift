//
//  NewsAppUnitTests.swift
//  NewsAppUnitTests
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import XCTest
@testable import NewsAppSwiftUI

final class NewsAppUnitTests: XCTestCase {

    private var articleList: ArticleList!
    
    override func setUp() {
        
        let mock = MockNetworkService<ArticleList>()
        mock.result = .success(NewsData.loadNewsMock())
        
        do {
            articleList = try mock.result.get()
        } catch {
            print(error)
        }
    }

    func test_populateAllNews_success_setsArticles_andClearsError() {
        
        // Assert
        XCTAssertEqual(articleList.articles.count, 3)
        XCTAssertEqual(articleList.articles[0].title, "Coca-Cola is about to report earnings. Here's what to expect - CNBC")
        XCTAssertEqual(articleList.articles[0].description, "Like rival PepsiCo, Coke has seen demand for its drinks fall as budget-conscious shoppers try to save more on their grocery bills.")
        XCTAssertEqual(articleList.articles[2].description, nil)
        
    }
    
    override func tearDown() {
        articleList = nil
    }
}
