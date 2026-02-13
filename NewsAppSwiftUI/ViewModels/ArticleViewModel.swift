//
//  ArticleViewModel.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

@MainActor
@Observable
class ArticleListViewModel {
    
    var articles: [ArticleViewModel] = []
    var networkService: NetworkProtocol
    var isLoading = false
    var errorMessage: String?
    
    init(networkService: NetworkProtocol) {
        self.networkService = networkService
        Task {
            await self.populateAllNews()
        }
    }
    
    private var apiKey: String {
        guard
            let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let dict = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any],
            let key = dict["API_KEY"] as? String
        else { return "" }
        
        return key
    }
    
    func populateAllNews() async {
            isLoading = true
            errorMessage = nil
            defer { isLoading = false }

            do {
                let response: ArticleList = try await networkService.request(
                    url: Constants.Urls.newsByApiKey(apiKey: apiKey)
                )
                articles = response.articles.map(ArticleViewModel.init)
            } catch let err as NetworkError {
                errorMessage = err.message
            } catch {
                errorMessage = error.localizedDescription
            }
        }
}

struct ArticleViewModel: Identifiable {
    let id = UUID()
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return article.title
    }
    
    var description: String {
        return article.description ?? ""
    }
    
    var url: String {
        return article.url ?? ""
    }
    
    var urlToImage: String {
        return article.urlToImage ?? ""
    }
}
