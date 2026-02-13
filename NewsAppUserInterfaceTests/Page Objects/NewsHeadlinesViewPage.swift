//
//  NewsHeadlinesViewPage.swift
//  NewsAppUserInterfaceTests
//
//  Created by Hamed Kharazmi on 13.02.26.
//

import Foundation
import XCTest

class NewsHeadlinesViewPage {
    
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var newsList: XCUIElement {
        app.tables["newsList"].firstMatch.exists ? app.tables["newsList"].firstMatch :
        app.collectionViews["newsList"].firstMatch.exists ? app.collectionViews["newsList"].firstMatch :
        app.otherElements["newsList"].firstMatch
    }
    
    var titleLabel: XCUIElement {
        newsList.cells.staticTexts["titleLabel"]
    }
    
    var descriptionLabel: XCUIElement {
        newsList.cells.staticTexts["descriptionLabel"]
    }
    
}
