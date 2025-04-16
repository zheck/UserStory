//
//  HomeView.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            if let error = viewModel.error {
                Text(String(describing: error))
            } else {
                contentView
            }
        }
        .task {
            await viewModel.loadStories()
        }
    }
    
    var contentView: some View {
        List {
            ForEach(viewModel.storyConfigs, id: \.id) { story in
                Text(story.description)
            }
            ProgressView()
                .task {
                    await viewModel.loadStories()
                }
        }
    }
}

