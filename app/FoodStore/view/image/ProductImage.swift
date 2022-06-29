//
//  NetworkImage.swift
//  Landmarks
//
//  Created by Maxik on 18.03.2022.
//

import SwiftUI

struct ProductImage: View {
    @State
    private var image: UIImage? = nil
    
    var url: URL? = nil
    
    func fgetchImage(
        from url: URL,
        completion: @escaping (Data?, URLResponse?, Error?) -> ()
    ) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        fgetchImage(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            self.image = UIImage(data: data)
        }
    }
    
    init(url: String) {
        self.url = URL(string: url)
    }
    
    var body: some View {
        if (url == nil) {
            NophotoImage()
        } else if (image == nil) {
            NophotoImage()
                .onAppear {
                    downloadImage(from: url!)
                }
        } else {
            Image(uiImage: image!)
        }
    }
}

struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImage(url: "https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg")
            .previewLayout(.fixed(width: 375, height: 375))

        ProductImage(url: "https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jp")
            .previewLayout(.fixed(width: 375, height: 375))

        ProductImage(url: "")
            .previewLayout(.fixed(width: 375, height: 375))

        ProductImage(url: "")
            .previewLayout(.fixed(width: 375, height: 375))
            .preferredColorScheme(.dark)
    }
}
