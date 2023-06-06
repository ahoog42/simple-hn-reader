//
//  DetailView.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 6/6/23.
//

import SwiftUI

struct DetailView: View {
    let url: String

    var body: some View {
        WebView(url: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.andrewhoog.com")
    }
}
