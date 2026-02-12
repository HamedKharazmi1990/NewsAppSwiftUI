//
//  LoadingView.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
            .font(.headline)
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 10)
    }
}

#Preview {
    LoadingView()
}
