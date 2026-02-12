//
//  NewsAppUserInterfaceTests.swift
//  NewsAppUserInterfaceTests
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import XCTest

class when_app_is_launched: XCTestCase {

    func test_should_display_available_news() {
        
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST", "FIXTURE": "news"]
        continueAfterFailure = false
        app.launch()
        
        let newsList =
            app.tables["newsList"].firstMatch.exists ? app.tables["newsList"].firstMatch :
            app.collectionViews["newsList"].firstMatch.exists ? app.collectionViews["newsList"].firstMatch :
            app.otherElements["newsList"].firstMatch
        XCTAssertEqual(3, newsList.cells.count)
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
