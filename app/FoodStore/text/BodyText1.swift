//
//  BodyText1.swift
//  Landmarks
//
//  Created by Maxik on 30.03.2022.
//

import SwiftUI

struct BodyText1: View {
    
    var text: String = ""
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(Font.custom("Montserrat-Medium", size: 20))
//            .foregroundColor(Color(red: 0, green: 0, blue: 0xFF))
    }
}

struct BodyText1_Previews: PreviewProvider {
    static var previews: some View {
        BodyText1("SOME TEXT")
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
