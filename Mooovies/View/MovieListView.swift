//
//  ContentView.swift
//  Mooovies
//
//  Created by Ayberk M on 23.05.2022.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var searchText = ""

    init() {
        self.movieListViewModel = MovieListViewModel()
        //UITableView.appearance().backgroundColor = .green // Uses UIColor

    }
        
    var body: some View {
        
        NavigationView{
            VStack {
            TextField("Search", text: $searchText) { _ in
                
            } onCommit: {
                self.movieListViewModel.doMovieSearch(movieName: searchText.trimmingCharacters(in: .whitespacesAndNewlines) .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchText)
            }.padding()

            List(movieListViewModel.movies, id: \.imdbId ){ moovie in
                HStack {
                    SpacialImage(url: moovie.poster)
                        .frame(width: 100, height: 150)
                    VStack(alignment:.leading) {
                    Text(moovie.title)
                            .font(.title3)
                            .foregroundColor(.blue)
                        Text(moovie.year)
                            .foregroundColor(.red)
                    }
                    
                }
            }.navigationTitle(Text("Mooovies")).listStyle(.plain)

        }
      
    }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
