//
//  BackgroundView.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [.blue.opacity(0.2), .purple.opacity(0.3)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .blur(radius: 40)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
