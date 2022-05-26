//
//  MovieViewModel.swift
//  Mooovies
//
//  Created by Ayberk M on 24.05.2022.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject {
   @Published var movies = [FilmViewModel]()
    let dowloaderClient = Downloader()
    
    func doMovieSearch(movieName: String) {
        dowloaderClient.DownloadMovie(search: movieName) { result in
            switch result {
            case.failure(let hata):
                print(hata)
            case.success(let movieArr):
                if let movieArr = movieArr {
                    DispatchQueue.main.async {
                        self.movies = movieArr.map(FilmViewModel.init)
                    }
                    }
            }
        }
    }
}

struct FilmViewModel {
    let movie : Movie
    
    var title : String {
        movie.title
    }
    var type : String {
        movie.type
    }
    
    var poster : String {
        movie.poster
    }
    var year : String {
        movie.year
    }
    var imdbId : String {
        movie.imdbId
    }
}
