//
//  ProductGrid.swift
//  FoodStore
//
//  Created by Maxik on 25.06.2022.
//

import SwiftUI

struct ProductGrid: View {
    var list: [Content]
    
    private func getGrid(width: CGFloat) -> [GridItem] {
        var count: Int = 2
        
        if (width >= 1024) {
            count = 6
        } else if (width >= 744) {
            count = 4
        }
        
        return Array(repeating: GridItem(.fixed(160)), count: count)
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                LazyVGrid(
                    columns: getGrid(width: geo.size.width),
                    spacing: 10
                ) {
                    ForEach(list) { product in
                        ProductCard(item: product)
                    }
                }
            }
        }
    }
}

struct ProductGrid_Previews: PreviewProvider {
    static var list: [Content] = loadJson("content.mock.json")
    
    static var previews: some View {
        ProductGrid(list: list)
            .previewDevice("iPhone 12")

        ProductGrid(list: list)
            .previewDevice("iPad mini (6th generation)")

        ProductGrid(list: list)
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
