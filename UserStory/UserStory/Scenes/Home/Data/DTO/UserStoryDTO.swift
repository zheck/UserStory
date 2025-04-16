//
//  UserStoryDTO.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

struct HomeResponseDTO: Decodable {

    struct Page: Decodable {
        let users: [UserStoryDTO]
    }

    let pages: [Page]
}

struct UserStoryDTO: Decodable {
    let id: Int
    let name: String
    let profile_picture_url: URL
}
