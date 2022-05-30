//
//  ImageDownloader.swift
//  Mooovies
//
//  Created by Ayberk M on 30.05.2022.
//

import Foundation

class ImageDownloader : ObservableObject {
    
    @Published var downloadedImage: Data?
    
    func downloadImage(url : String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = data
            }

        }.resume()
    }
    
    
}
