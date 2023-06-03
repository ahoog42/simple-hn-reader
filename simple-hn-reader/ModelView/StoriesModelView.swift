//
//  StoriesModelView.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 6/1/23.
//

import Foundation
import Firebase

// using Firebase, get the top 500 stories
// https://hacker-news.firebaseio.com/v0/topstories.json

class StoriesModelView: ObservableObject {
    @Published var stories = [Story]()
    
    init() {
        fetchStories()   
    }
    
    func fetchStories() {
        // connect to HackerNews API with Firebase Database
        let db = Database.database(url: "https://hacker-news.firebaseio.com/").reference().child("v0").child("topstories")
        // pull top 500 stories
        db.queryLimited(toFirst: 50).getData(completion: { error, snapshot in
            if let error = error {
                print("Error: \(error)")
                return
            }
            // loop through the first 500 stories
            for child in snapshot!.children {
                // get the story id
                let snap = child as! DataSnapshot
                let value = snap.value as! Int
                // get the story details
                let db = Database.database(url: "https://hacker-news.firebaseio.com/").reference().child("v0").child("item").child("\(value)")
                db.getData(completion: { error, snapshot in
                    // if there is an error, print it out and return
                    if let error = error {
                        print("Error: \(error)")
                        return
                    }
                    let value = snapshot?.value as! [String: Any]
                    if let id = value["id"] as? Int {
                        let title = value["title"] as? String ?? ""
                        let type = value["type"] as? String ?? ""
                        let url = value["url"] as? String ?? ""
                        let by = value["by"] as? String ?? ""
                        let time = value["time"] as? Int ?? 0
                        let score = value["score"] as? Int ?? 0
                        let descendants = value["descendants"] as? Int ?? 0
                        let kids = value["kids"] as? [Int] ?? []
                        let story = Story(id: id, title: title, type: type, url: url, by: by, time: time, score: score, descendants: descendants, kids: kids)
                        // add each story to the stories array and then print out the id, title and url
                        self.stories.append(story)
                        print("id: \(id), title: \(title), url: \(url), points: \(score)")
                    } else {
                        // handle the case where id is missing
                        print("Error: Invalid story data. Missing id: \(value)")
                    }
                })
            }
        })
    }
    
}
