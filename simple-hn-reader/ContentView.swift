//
//  ContentView.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // create a TabView with a NavigationStack
        // there should be four views in the TabView
        // 1. NewsView
        // 2. SearchView
        // 3. AccountView
        // 4. SettingsView
        TabView {
            NavigationView {
                NewsView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("News")
            }
//            NavigationView {
//                SearchView()
//            }
//            .tabItem {
//                Image(systemName: "magnifyingglass")
//                Text("Search")
//            }
//            NavigationView {
//                AccountView()
//            }
//            .tabItem {
//                Image(systemName: "person")
//                Text("Account")
//            }
//            NavigationView {
//                SettingsView()
//            }
//            .tabItem {
//                Image(systemName: "gear")
//                Text("Settings")
//            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
