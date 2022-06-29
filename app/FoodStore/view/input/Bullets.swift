//
//  Bullets.swift
//  Landmarks
//
//  Created by Maxik on 30.03.2022.
//

import SwiftUI

struct Bullets: View {
    var count: Int = 1
    
    var current: Int = 1
    
    private func getItem(_ index: Int) -> some View {
        Circle()
            .fill(Color("MainColor"))
            .opacity(index == current ? 1 : 0.6)
            .frame(width: 12, height: 12)
        
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach((1...count), id: \.self) { index in
                getItem(index)
            }
        }
    }
}

struct Bullets_Previews: PreviewProvider {
    static var previews: some View {
        Bullets(count: 1)
            .previewLayout(.fixed(width: 375, height: 100))

        Bullets(count: 2)
            .previewLayout(.fixed(width: 375, height: 100))

        Bullets(count: 3, current: 2)
            .previewLayout(.fixed(width: 375, height: 100))

        Bullets(count: 4, current: 3)
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
