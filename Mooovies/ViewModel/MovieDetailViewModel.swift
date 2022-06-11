//
//  MovieDetailViewModel.swift
//  Mooovies
//
//  Created by Ayberk M on 8.06.2022.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetail : MovieDetailsViewModel?
    
    let downloaderClient = Downloader()
    
    func getMovieDetails(imdbId : String) {
        
        downloaderClient.DownloadMovieDetails(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let movie):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailsViewModel(detail: movie)
                }
                
            }
        }
    }
}

struct MovieDetailsViewModel {
    
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var year : String {
        detail.year
    }

    var poster : String {
        detail.poster
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }

    var writer : String {
        detail.writer
    }
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }




}
