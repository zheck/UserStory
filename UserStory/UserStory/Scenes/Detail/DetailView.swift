//
//  DetailView.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import SwiftUI

struct DetailView: View {

    @ObservedObject var viewModel: DetailViewModel

    init(story: UserStory) {
        viewModel = DetailViewModel(story: story)
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: viewModel.imageURL)
            Text(viewModel.imageURL.absoluteString)
            VStack(alignment: .leading) {
                Spacer()
                HStack(alignment: .bottom) {
                    Image(systemName: "heart.fill")
                        .onTapGesture {
                            viewModel.toggleFavorite()
                        }
                        .foregroundStyle(viewModel.isFavorite ? .red : .white)
                        .padding()
                    Spacer()
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
