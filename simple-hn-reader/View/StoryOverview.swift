//
//  StoryOverview.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 6/2/23.
//

import SwiftUI

struct StoryOverview: View {
    // create a Story property
    var story: Story


    var body: some View {
        // create a var called storyDomain what is the domain name from the url
        // remove the https:// or http:// from the url
        // and then remove everything after the first / in the url
        let storyDomain = story.url.replacingOccurrences(of: "https://", with: "").replacingOccurrences(of: "http://", with: "").components(separatedBy: "/")[0]

        // create a VStack with two HStacks embedded
        // the first HStack should contain the title the domain name from the url
        // the second HStack should contain the score, the number of comments, and the author
        // the VStack should have a padding of 10
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                if story.url == nil || story.url == "" {
                    Text(story.title)
                } else {
                    Link(story.title, destination: URL(string: story.url)!)
                }
            }
            HStack {
                Link(storyDomain, destination: URL(string: "https://news.ycombinator.com/from?site=\(storyDomain)")!)
            }
            HStack {
                Text("\(String(story.score)) points ")
                Text("by \(String(story.by)) ")
                Text("| \(String(story.descendants)) comments")
            }
        }
        .padding(10)
    }

    // create an init function that takes a Story as a parameter
    init(story: Story) {
        // set the title and domain properties
        // set the score, number of comments, and author properties
        // set the story property
        self.story = story
    }

}

//struct StoryOverview_Previews: PreviewProvider {
//    static var previews: some View {
//        var testStory = Story(id: 36169019, title: "Speed running Monkey Island", type: "story", url: "https://www.grumpygamer.com/speed_running_mi", by: "mepian", time: 12312341231, score: 50, descendants: 13, kids: [1232])
//        StoryOverview(story: testStory)
//    }
//}
