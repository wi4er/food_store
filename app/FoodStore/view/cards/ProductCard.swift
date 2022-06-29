//
//  ProductCard.swift
//  Landmarks
//
//  Created by Maxik on 24.06.2022.
//

import SwiftUI

struct ProductCard: View {
    var item: Content
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(item.previewImage)
                    .resizable()
                    .scaledToFit()
            }
            .frame(height: 127)

            HStack {
                Text(item.name)
                    .font(Font.custom("Montserrat-Medium", size: 14))
                    .padding(11)
                    .frame(height: 42)
                    
                Spacer(minLength: 0)
            }

            HStack(spacing: 3) {
                Image("buy_icon")

                Text("Tradly")
                    .font(Font.custom("Montserrat-Medium", size: 14))
                    .opacity(0.5)

                Spacer()

                Text("$35")
                    .font(Font.custom("Montserrat-Regular", size: 10))
                    .strikethrough(true)

                Text("$25")
                    .font(Font.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(Color("MainColor"))
            }
            .padding(.leading, 12)
            .padding(.trailing, 12)
            .frame(height: 19)
        }
        .padding(.bottom, 12)
        .frame(width: 160, height: 200)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black.opacity(0.1), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var list: [Content] = loadJson("content.mock.json")
    
    static var previews: some View {
        ProductCard(item: list[0])
            .previewLayout(.fixed(width: 300, height: 300))

        ProductCard(item: list[1])
            .previewLayout(.fixed(width: 300, height: 300))
        
        ProductCard(item: list[2])
            .previewLayout(.fixed(width: 300, height: 300))
            .preferredColorScheme(.dark)
    }
}
