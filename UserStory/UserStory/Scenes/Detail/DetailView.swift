//
//  DetailView.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import SwiftUI

struct DetailView: View {

    private let storyConfig: StoryConfig
    private let viewModel: DetailViewModel

    init(storyConfig: StoryConfig) {
        self.storyConfig = storyConfig
        // TODO: use a proper factory to generate viewModel
        viewModel = DetailViewModel(storyId: storyConfig.id)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModel.onAppear()
            }
    }
}
