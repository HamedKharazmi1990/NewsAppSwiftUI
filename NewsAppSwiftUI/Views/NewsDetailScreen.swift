//
//  NewsDetailScreen.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import SwiftUI

struct NewsDetailScreen: View {
    
    let urlString: String
    
    var body: some View {
        VStack {
            if let url = URL(string: urlString) {
                WebView(url)
            } else {
                ContentUnavailableView("Invalid link", systemImage: "link.badge.plus")
            }
        }
        .accessibilityIdentifier("newsDetailScreen")
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    NewsDetailScreen(urlString: "")
}
