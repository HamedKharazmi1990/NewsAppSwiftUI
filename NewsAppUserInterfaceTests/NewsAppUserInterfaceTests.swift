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
