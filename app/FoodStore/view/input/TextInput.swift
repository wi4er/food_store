//
//  TextInput.swift
//  Landmarks
//
//  Created by Maxik on 21.03.2022.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct TextInput: View {
    @Binding
    var text: String
    
    var placeholder: String
    
    var enable: Bool = true
    
    var body: some View {
        TextField("", text: $text)
            .placeholder(when: text.isEmpty) {
                Text(placeholder)
                    .font(Font.custom("Montserrat-Regulard", size: 18))
            }
            .padding(EdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 0))
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.white, lineWidth: 2)
            )
            .font(Font.custom("Montserrat-SemiBold", size: 18))
            .foregroundColor(Color.white)
            .disabled(!enable)
            .opacity(enable ? 1 : 0.4)
    }
}

struct TextInput_Previews: PreviewProvider {
    @State
    static private var state: String = ""
    
    static var previews: some View {
        TextInput(text: $state, placeholder: "Placeholder")
            .previewLayout(.fixed(width: 375, height: 300))

        TextInput(text: $state, placeholder: "Placeholder")
            .previewLayout(.fixed(width: 375, height: 100))
            .preferredColorScheme(.dark)

        TextInput(text: $state, placeholder: "Placeholder")
            .previewLayout(.fixed(width: 375, height: 100))
            .preferredColorScheme(.dark)
    }
}
