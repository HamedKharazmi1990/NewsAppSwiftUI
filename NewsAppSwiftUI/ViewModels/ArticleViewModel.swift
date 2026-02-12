//
//  ArticleViewModel.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

@Observable
class ArticleListViewModel {
    
    var articles: [ArticleViewModel] = []
    var networkService: NetworkProtocol
    var isLoading = false
    var errorMessage: String?
    
    init(networkService: NetworkProtocol) {
        self.networkService = networkService
        self.populateAllNews()
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
    
    func populateAllNews() {
        isLoading = true
        errorMessage = nil
        
        networkService.request(url: Constants.Urls.newsByApiKey(apiKey: apiKey)) { (result: Result<ArticleList, NetworkError>)  in
            switch result {
            case .success(let articleResponse):
                DispatchQueue.main.async {
                    self.articles = articleResponse.articles.map(ArticleViewModel.init)
                }
            case .failure(let error):
                self.errorMessage = error.message
            }
            self.isLoading = false
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
