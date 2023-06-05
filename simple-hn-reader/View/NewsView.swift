//
//  NewsView.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 6/1/23.
//

import SwiftUI

struct NewsView: View {
    // create a stateobject for the TopStoriesModelView
    @StateObject var storiesModelView = StoriesModelView()
    
    var body: some View {
        // create a ScrollView with a LazyVStack embedded
        // the LazyVStack should contain a ForEach loop that iterates over the storiesModelView.stories property
        // the ForEach loop should create a StoryOverview for each story
        // the ScrollView should have a padding of 10
        ScrollView {
LazyVStack {
    ForEach(Array(storiesModelView.stories.enumerated()), id: \.1.id) { index, story in
        StoryOverview(story: story, number: index + 1)
        Divider()
    }
}
            .padding(10)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
