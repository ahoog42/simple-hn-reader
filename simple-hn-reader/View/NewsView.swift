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
        Text("HN Stories")
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
