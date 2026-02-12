//
//  ContentView.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import SwiftUI

struct NewsHeadlinesView: View {
    
    @State private var vm = ArticleListViewModel(networkService: NetworkServiceFactory.create(ArticleList.self))
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                List(vm.articles) { articleModel in
                    NavigationLink {
                        NewsDetailScreen(urlString: articleModel.url)
                    } label: {
                        ArticleRowView(article: articleModel)
                    }

                }
                .accessibilityIdentifier("newsList")
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                
                if vm.isLoading {
                    LoadingView()
                }
            }
            .alert("Error", isPresented: .constant(vm.errorMessage != nil)) {
                Button("OK") {
                    vm.errorMessage = nil
                }
            } message: {
                Text(vm.errorMessage ?? "")
            }
            .navigationTitle("Top Headlines")
            .refreshable {
                vm.populateAllNews()
            }
        }
    }
}

#Preview {
    NewsHeadlinesView()
}
