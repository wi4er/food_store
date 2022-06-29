//
//  OnboardForm.swift
//  Landmarks
//
//  Created by Maxik on 30.03.2022.
//

import SwiftUI

enum OnboardStep {
    case first;
    case second;
    case third;
}

struct OnboardForm: View {
    @State
    var step: OnboardStep = .first
    
    let onboardList: Dictionary<OnboardStep, OnboardItem> = [
        .first: OnboardItem(
            image: Image("onboarding1"),
            text: "Empowering Artisans, Farmers & Micro Business",
            order: 1
        ),
        .second: OnboardItem(
            image: Image("onboarding2"),
            text: "Connecting NGOs, Social Enterprises with Communities",
            order: 2
        ),
        .third: OnboardItem(
            image: Image("onboarding3"),
            text: "Donate, Invest & Support infrastructure projects",
            order: 3
        )
    ]
    
    func getMove() {
        switch(step) {
        case .first: step = .second
        case .second: step = .third
        case .third: do {
            step = .first
        }
        }
    }
        
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color("MainColor"))
                        .frame(height: geo.size.height * 0.44)
                    Rectangle()
                        .fill(Color("WhiteColor"))
                        .frame(height: geo.size.height * 0.56)
                }
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 49) {
                            onboardList[step]?.image
//                                .resizable()

                            BodyText1(onboardList[step]?.text ?? "")
                                .foregroundColor(Color("MainColor"))
                                .multilineTextAlignment(.center)
                                
                            Bullets(count: 3, current: onboardList[step]?.order ?? 1)
                            
                            CommonButton(
                                size: .big,
                                action: getMove
                            ) {
                              Text("Next")
                            }

                        }
                        .background(Color("WhiteColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(maxWidth: 307, maxHeight: 607)
                        .padding(.top, 140)

                        Spacer()
                    }

                    Spacer()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct OnboardForm_Previews: PreviewProvider {
    static var previews: some View {
        OnboardForm()
            .previewDevice("iPhone 12")

        OnboardForm(step: .second)
            .previewDevice("iPad mini(6th generation)")

        OnboardForm()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
