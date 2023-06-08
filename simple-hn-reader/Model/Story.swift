//
//  Story.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 6/1/23.
//

import Foundation

// create a Codable struct for a Story
// the struct should have the following properties:
// 1. id: Int
// 2. title: String
// 3. url: String
// 4. by: String
// 5. time: Int
// 6. score: Int
// 7. descendants: Int
// 8. kids: [Int]
struct Story: Codable, Identifiable {
    let id: Int
    let title: String
    let type: String
    let url: String
    let by: String
    let time: Int
    let score: Int
    let descendants: Int
    let kids: [Int]? // this is an optional because some stories don't have comments

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case type
        case url
        case by
        case time
        case score
        case descendants
        case kids
    }
}
