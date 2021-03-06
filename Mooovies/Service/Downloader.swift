//
//  Downloader.swift
//  Mooovies
//
//  Created by Ayberk M on 23.05.2022.
//

import Foundation

class Downloader {
    func DownloadMovie(search : String, completion : @escaping (Result<[Movie]?,DownloaderError>) -> Void ) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=c38cc4ed&s=\(search)") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MoviesSearch.self, from: data) else {
                return completion(.failure(.dataCannotProcessed))
            }
            
            completion(.success(movieResponse.movies))
        }.resume() // end session
}
    
    func DownloadMovieDetails(imdbId : String, completion : @escaping (Result<MovieDetail,DownloaderError>) -> Void ) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=c38cc4ed&i=\(imdbId)") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.dataCannotProcessed))
            }
            
            completion(.success(movieDetailResponse))
        }.resume() // end session
}
    
}

enum DownloaderError : Error {
    case wrongUrl
    case noData
    case dataCannotProcessed
}
