//
//  StoryView.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import SwiftUI

struct StoryView: View {

    let story: StoryConfig
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(story.id)
                Text(story.description)
            }
            .foregroundStyle(story.hasSeen ? .secondary : .primary)
            Spacer()
            AsyncImage(url: story.image) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
        }
    }
}
