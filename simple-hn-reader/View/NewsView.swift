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
        // Text("HN Stories")
        // create a list of stories from the storiesModelView
        // display in a scrollable list
        List(storiesModelView.stories) { story in
            // display the story title
            Text(story.title)
        }

    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
