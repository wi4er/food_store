//
//  NophotoImage.swift
//  Landmarks
//
//  Created by Maxik on 19.03.2022.
//

import SwiftUI

struct NophotoImage: View {
    var body: some View {
        Image("no-photo")
            .renderingMode(.template)
            .resizable()
            .foregroundColor(Color("NophotoColor"))
    }
}

struct NophotoImage_Previews: PreviewProvider {
    static var previews: some View {
        NophotoImage()
            .previewLayout(.fixed(width: 375, height: 375))
        
        NophotoImage()
            .previewLayout(.fixed(width: 375, height: 375))
            .preferredColorScheme(.dark)
    }
}
