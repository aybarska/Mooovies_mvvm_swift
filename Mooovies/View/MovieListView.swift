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
    }
    @State private var isAnimating = false
    var body: some View {
        
        NavigationView{
            
            VStack {
                
            TextField("Search", text: $searchText) { _ in
                
            } onCommit: {
                self.movieListViewModel.doMovieSearch(movieName: searchText.trimmingCharacters(in: .whitespacesAndNewlines) .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchText)
            }                .padding(7)
                    .background(Color(.systemGray5))
                    .cornerRadius(13)
                    .padding(.horizontal, 15)
            List(movieListViewModel.movies, id: \.imdbId ){ moovie in
                NavigationLink(
                    destination: DetailView(imdbId:moovie.imdbId),
                    label: {

                        MoovieCard(poster: moovie.poster, title: moovie.title, year: moovie.year)
                    })
            }.navigationTitle(Text("Mooovies")).listStyle(.inset)

            }
      
        }.colorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

struct MoovieCard: View {
    var poster: String
    var title: String
    var year: String
    
    var body: some View {
        HStack {
            SpacialImage(url: poster)
                .frame(width: 100, height: 150)
            VStack(alignment:.leading) {
            Text(title)
                    .font(.title3)
                    .foregroundColor(.blue)
                Text(year)
                    .foregroundColor(.gray)

            }
            
        }
        
    }
}
