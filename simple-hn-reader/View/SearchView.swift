//
//  SearchView.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 6/1/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel = SearchViewModel()

    var body: some View {
        // create a NavigationView with a textfield in the navigation bar
        // the textfield should bind to the searchViewModel.searchTerm property
        // the NavigationView should have a title of "Search"
        // the NavigationView should have a List embedded
        // the List should contain a ForEach loop that iterates over the searchViewModel.searchResults property
        // the ForEach loop should create a StoryOverview for each story
        NavigationView {
            VStack {
                HStack {
                TextField("Search", text: $searchViewModel.searchTerm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                // add a search button to the navigation bar that calls the searchViewModel.search() method
                // use the magnifyingglass icon for the button
                Button(action: {
                    searchViewModel.search()
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
                }
                List(searchViewModel.searchResults) { story in
                        Text(story.title ?? "No Title")
                            .font(.headline)
                            .padding(10)
                        Divider()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
