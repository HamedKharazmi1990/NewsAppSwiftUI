//
//  NewsAppUserInterfaceTests.swift
//  NewsAppUserInterfaceTests
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import XCTest

class when_app_is_launched: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        app.launchEnvironment =  ["ENV": "TEST", "FIXTURE": "news"]
        continueAfterFailure = false
        app.launch()
    }

    func test_should_display_available_news() {
        
        let newsList =
            app.tables["newsList"].firstMatch.exists ? app.tables["newsList"].firstMatch :
            app.collectionViews["newsList"].firstMatch.exists ? app.collectionViews["newsList"].firstMatch :
            app.otherElements["newsList"].firstMatch
        XCTAssertEqual(3, newsList.cells.count)
    }
    
    func test_should_display_news_title() {
        
        let newsList =
            app.tables["newsList"].firstMatch.exists ? app.tables["newsList"].firstMatch :
            app.collectionViews["newsList"].firstMatch.exists ? app.collectionViews["newsList"].firstMatch :
            app.otherElements["newsList"].firstMatch
        
        XCTAssertTrue(newsList.waitForExistence(timeout: 5))
    
        let title = newsList.cells.staticTexts["titleLabel"].firstMatch
        XCTAssertTrue(title.waitForExistence(timeout: 5))
        XCTAssertEqual(title.label, "Coca-Cola is about to report earnings. Here's what to expect - CNBC")
    }
    
    func test_should_display_news_description() {
        
        let newsList =
            app.tables["newsList"].firstMatch.exists ? app.tables["newsList"].firstMatch :
            app.collectionViews["newsList"].firstMatch.exists ? app.collectionViews["newsList"].firstMatch :
            app.otherElements["newsList"].firstMatch
        
        XCTAssertTrue(newsList.waitForExistence(timeout: 5))
    
        let description = newsList.cells.staticTexts["descriptionLabel"].firstMatch
        XCTAssertTrue(description.waitForExistence(timeout: 5))
        XCTAssertEqual(description.label, "Like rival PepsiCo, Coke has seen demand for its drinks fall as budget-conscious shoppers try to save more on their grocery bills.")
    }
}

class when_user_taps_on_a_news: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        app.launchEnvironment =  ["ENV": "TEST", "FIXTURE": "news"]
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_display_news_for_the_selected_news() {
        
        app.staticTexts["Coca-Cola is about to report earnings. Here's what to expect - CNBC"].tap()
        app.buttons["Top Headlines"].tap()
        
    }
    
    func test_should_display_error_message_for_the_selected_news_with_no_url() {
        
        app.staticTexts["How the Trump administration skirts — and defies — court rulings on ICE detentions - Politico"].tap()
        XCTAssertTrue(app.staticTexts["Invalid link"].firstMatch.exists)
        
    }
    
}
