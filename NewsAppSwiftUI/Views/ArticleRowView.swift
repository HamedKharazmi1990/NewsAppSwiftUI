//
//  ArticleRowView.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import SwiftUI

struct ArticleRowView: View {
    
    let article: ArticleViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: article.urlToImage)) { phase in
                switch phase {
                case .empty, .failure:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.thinMaterial)
                        .frame(width: 80, height: 80)
                        .overlay {
                            Image(systemName: "photo")
                                .foregroundStyle(.secondary)
                        }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                @unknown default:
                    EmptyView()
                }
                
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .accessibilityIdentifier("titleLabel")
                
                Text(article.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .accessibilityIdentifier("descriptionLabel")
            }
        }
    }
}

#Preview {
    ArticleRowView(article:
            .init(.init(
                title: "Some title",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            url: "",
            urlToImage: "")
            )
    )
}
