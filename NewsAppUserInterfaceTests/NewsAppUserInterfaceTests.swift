//
//  NewsAppUserInterfaceTests.swift
//  NewsAppUserInterfaceTests
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import XCTest

class when_app_is_launched: XCTestCase {
    
    let app = XCUIApplication()
    private var newsHeadlinesViewPage: NewsHeadlinesViewPage!
    
    override func setUp() {
        app.launchEnvironment =  ["ENV": "TEST", "FIXTURE": "news"]
        newsHeadlinesViewPage = NewsHeadlinesViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }

    func test_should_display_available_news() {
        
        let newsList = newsHeadlinesViewPage.newsList
        XCTAssertEqual(3, newsList.cells.count)
    }
    
    func test_should_display_news_title() {
        
        let newsList = newsHeadlinesViewPage.newsList
        XCTAssertTrue(newsList.waitForExistence(timeout: 5))
    
        let title = newsHeadlinesViewPage.titleLabel.firstMatch
        XCTAssertEqual(title.label, "Coca-Cola is about to report earnings. Here's what to expect - CNBC")
    }
    
    func test_should_display_news_description() {
        
        let newsList = newsHeadlinesViewPage.newsList
        XCTAssertTrue(newsList.waitForExistence(timeout: 5))
    
        let description = newsHeadlinesViewPage.descriptionLabel.firstMatch
        XCTAssertEqual(description.label, "Like rival PepsiCo, Coke has seen demand for its drinks fall as budget-conscious shoppers try to save more on their grocery bills.")
    }
}

class when_user_taps_on_a_news: XCTestCase {
    
    let app = XCUIApplication()
    private var newsHeadlinesViewPage: NewsHeadlinesViewPage!
    
    override func setUp() {
        app.launchEnvironment =  ["ENV": "TEST", "FIXTURE": "news"]
        newsHeadlinesViewPage = NewsHeadlinesViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_display_news_for_the_selected_news() {
        
        let newsList = newsHeadlinesViewPage.newsList
        XCTAssertTrue(newsList.waitForExistence(timeout: 5))
    
        newsHeadlinesViewPage.descriptionLabel.firstMatch.tap()
        app.buttons["Top Headlines"].tap()
        
    }
    
    func test_should_display_error_message_for_the_selected_news_with_no_url() {
        
        app.staticTexts["How the Trump administration skirts — and defies — court rulings on ICE detentions - Politico"].tap()
        XCTAssertTrue(app.staticTexts["Invalid link"].firstMatch.exists)
        
    }
    
}
