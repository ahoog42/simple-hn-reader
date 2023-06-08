//
//  SearchViewModel.swift
//  simple-hn-reader
//
//  Created by Hiro Protagonist on 6/7/23.
//

import Foundation

// create a class that conforms to ObservableObject
// the class should have the following properties:
// 1. searchTerm: String
// 2. searchResults: [SearchResults]
// 3. isLoading: Bool
// 4. errorMessage: String
// 5. searchURL: URL
// 6. searchTask: URLSessionDataTask?
// 7. searchSession: URLSession
// 8. searchDecoder: JSONDecoder

class SearchViewModel: ObservableObject {
    @Published var searchResults = [Post]()
    @Published var searchTerm = ""
    // @Published var isLoading = false
    // @Published var errorMessage = ""
    
    private var searchURL: URL? {
        guard let encodedSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        return URL(string: "https://hn.algolia.com/api/v1/search?query=\(encodedSearchTerm)&tags=story")
    }

    private var searchTask: URLSessionDataTask?
    private let searchSession = URLSession(configuration: .default)
    private let searchDecoder = JSONDecoder()

    // create a function called search that takes no parameters and returns no values
    // the function should:
    // 1. set isLoading to true
    // 2. set errorMessage to ""
    // 3. create a URLSessionDataTask using the searchSession and searchURL
    // 4. decode the results into an array of SearchResults
    // 5. set searchResults to the decoded results
    // 6. set isLoading to false
    // 7. catch any errors and set errorMessage to the localizedDescription
    func search() {
        guard let searchURL = searchURL else {
            print("Invalid search URL")
            return
        }
        print("searchURL: \(searchURL)")
        // isLoading = true
        // errorMessage = ""
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: searchURL) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        print(safeData)
                        let decodedResults = try decoder.decode(SearchResults.self, from: safeData)
                        DispatchQueue.main.async {
                            self.searchResults = decodedResults.hits
                            // print("search results: \(self.searchResults)")
                            // self.isLoading = false
                        }
                    } catch {
                        print("Error: \(error)")
                        // self.errorMessage = error.localizedDescription
                    }
                } else {
                    print("Error: Data is nil")
                }
            } else {   
                print("Error: \(error)")
                // self.errorMessage = error?.localizedDescription ?? "Unknown error"
            }
        }
        task.resume()
    }
}
