//
//  SearchResults.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 6/7/23.
//

import Foundation

// create a Codable and Indenfiable Struct with results from the Search API
// the results will be an object with an array called hits
// the hits array will contain objects with the following properties:
// 1. created_at: String
// 2. title: String
// 3. url: String
// 4. author: String
// 5. points: Int
// 6. story_text: String
// 7. comment_text: String
// 8. num_comments: Int
// 9. story_id: Int
// 10. story_title: String
// 11. story_url: String
// 12. parent_id: Int
// 13. created_at_i: Int
// 14. objectID: String

struct SearchResults: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String { return objectID}
    let created_at: String
    let title: String?
    let url: String?
    let author: String
    let points: Int?
    let story_text: String?
    let comment_text: String?
    let num_comments: Int?
    let story_id: Int?
    let story_title: String?
    let story_url: String?
    let parent_id: Int?
    let created_at_i: Int
    let objectID: String

    enum CodingKeys: String, CodingKey {
        case created_at
        case title
        case url
        case author
        case points
        case story_text
        case comment_text
        case num_comments
        case story_id
        case story_title
        case story_url
        case parent_id
        case created_at_i
        case objectID
    }
}
