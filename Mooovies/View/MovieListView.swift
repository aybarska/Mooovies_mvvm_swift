//
//  ContentView.swift
//  Mooovies
//
//  Created by Ayberk M on 23.05.2022.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel : MovieListViewModel
    init() {
        self.movieListViewModel = MovieListViewModel()
        self.movieListViewModel.doMovieSearch(movieName: "Dabbe")
    }
    
    var body: some View {
        NavigationView{
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
            }
        }.navigationTitle(Text("Mooovies"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
