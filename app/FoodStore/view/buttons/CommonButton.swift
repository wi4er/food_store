//
//  CommonButton.swift
//  Landmarks
//
//  Created by Maxik on 22.03.2022.
//

import SwiftUI

struct CommonButton<Label>: View where Label : View {
    enum CommonButtonSize {
        case big
        case mid
        case small
        case micro
    }
    
    enum CommonButtonColor {
        case main
        case white
    }
    
    var enable: Bool = true
    
    var size: CommonButtonSize = .big
    
    var color: CommonButtonColor = .main
    
    var action: () -> Void = {}
    
    @ViewBuilder
    var label: () -> Label
    
    private func getBackgroundColor() -> Color {
        return color == .main ? Color("MainColor") : Color("WhiteColor")
    }
    
    private func getFontColor() -> Color {
        return color == .main ? Color("WhiteColor") : Color("MainColor")
    }
    
    private func getPadding() -> EdgeInsets {
        switch(size) {
        case .big: return EdgeInsets(top: 14, leading: 100, bottom: 14, trailing: 100)
        case .mid: return EdgeInsets(top: 12, leading: 60, bottom: 12, trailing: 60)
        case .small: return EdgeInsets(top: 9, leading: 40, bottom: 9, trailing: 40)
        case .micro: return EdgeInsets(top: 4, leading: 23, bottom: 4, trailing: 23)
        }
    }
    
    private func getFont() -> Font {
        switch(size) {
        case .big: return Font.custom("Montserrat-SemiBold", size: 18)
        case .mid: return Font.custom("Montserrat-SemiBold", size: 18)
        case .small: return Font.custom("Montserrat-Medium", size: 16)
        case .micro: return Font.custom("Montserrat-Medium", size: 12)
        }
    }
    
    var body: some View {
        Button(action: action) {
            label()
                .font(getFont())
                .foregroundColor(getFontColor())
                .padding(getPadding())
                .background(RoundedRectangle(cornerRadius: 24).fill(getBackgroundColor()))
        }
        .disabled(!enable)
        .opacity(enable ? 1 : 0.4)
    }
}

struct CommonButton_Previews: PreviewProvider {
    static var previews: some View {
        CommonButton() {
            Text("ButtonText")
        }
        .previewLayout(.fixed(width: 375, height: 100))
        
        CommonButton(size: .mid) {
            Text("ButtonText")
        }
        .previewLayout(.fixed(width: 375, height: 100))
        
        CommonButton(size: .small) {
            Text("ButtonText")
        }
        .previewLayout(.fixed(width: 375, height: 100))
        
        CommonButton(size: .micro) {
            Text("ButtonText")
        }
        .previewLayout(.fixed(width: 375, height: 100))
        
        CommonButton(
            enable: false,
            size: .big,
            color: .main
        ) {
            Text("ButtonText")
        }
        .previewLayout(.fixed(width: 375, height: 100))
        
        CommonButton(
            size: .big,
            color: .white
        ) {
            Text("ButtonText")
        }
        .previewLayout(.fixed(width: 375, height: 100))
        .padding()
        .background(.green)
    }
}
