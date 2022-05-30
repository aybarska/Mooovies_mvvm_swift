//
//  SpacialImage.swift
//  Mooovies
//
//  Created by Ayberk M on 30.05.2022.
//

import SwiftUI

struct SpacialImage: View {
    let url: String
    @ObservedObject var imageDownloader = ImageDownloader()
    
    init(url:String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloader.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder")
                .resizable()
        }
    }
}

struct SpacialImage_Previews: PreviewProvider {
    static var previews: some View {
        SpacialImage(url: "https://m.media-amazon.com/images/M/MV5BNzc5MTczNDQtNDFjNi00ZDU5LWFkNzItOTE1NzQzMzdhNzMxXkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_SX300.jpg")
    }
}
