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
    @State private var isAnimating = false

    let startGradient = Gradient(colors: [.blue, .yellow]) // Very popular these days
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
            TextField("Search", text: $searchText) { _ in
                
            } onCommit: {
                self.movieListViewModel.doMovieSearch(movieName: searchText.trimmingCharacters(in: .whitespacesAndNewlines) .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchText)
            }                .padding(7)
                    .background(Color(.systemGray5))
                    .cornerRadius(13)
                    .padding(.horizontal, 15)//.textFieldStyle(.roundedBorder)

            List(movieListViewModel.movies, id: \.imdbId ){ moovie in
                NavigationLink(
                    destination: DetailView(imdbId:moovie.imdbId),
                    label: {
                HStack {
                    SpacialImage(url: moovie.poster)
                        .frame(width: 100, height: 150)
                    VStack(alignment:.leading) {
                    Text(moovie.title)
                            .font(.title3)
                            .foregroundColor(.blue)
                        Text(moovie.year)
                            .foregroundColor(.gray)

                    }
                    
                }//.listRowBackground(Color.clear)
                        
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
