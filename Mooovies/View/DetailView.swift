//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Atil Samancioglu on 17.10.2020.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack(alignment:.leading, spacing:5){
            HStack{
                Spacer()
                SpacialImage(url: filmDetayViewModel.movieDetail?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                Spacer()
            }
            
            Text(filmDetayViewModel.movieDetail?.title ?? "Moovie Name").font(.title).foregroundColor(.blue).padding()
            
            Text(filmDetayViewModel.movieDetail?.plot ?? "Moovie Plot").padding()
            
            Text("Director: \(filmDetayViewModel.movieDetail?.director ?? "null")").padding()
            
            Text("Writer: \(filmDetayViewModel.movieDetail?.writer ?? "null")").padding()
            
            Text("Awards: \(filmDetayViewModel.movieDetail?.awards ?? "null")").padding()
            
            Text("Year: \(filmDetayViewModel.movieDetail?.year ?? "null")").padding()
            
            Spacer()
            
        }.onAppear(perform: {
            self.filmDetayViewModel.getMovieDetails(imdbId: imdbId)
        })
        
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "tt2560140")
    }
}
