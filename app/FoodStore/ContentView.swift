//
//  ContentView.swift
//  Landmarks
//
//  Created by Maxik on 17.03.2022.
//

import SwiftUI


extension Color {
    public static let mainColor: Color = Color("MainColor")
}


enum AppStage: Hashable {
    case onboard
    case authorization
    case home
    case browse
    case store
    case order
    case profile
}


struct ContentView: View {
    @State
    private var stage = 2
    
    var body: some View {
//        if (true) {
//            return OnboardForm()
//        }

        TabView(selection: $stage) {
            HomeRoot()
                .tabItem {
                    Image("home")
                        .renderingMode(.template)

                    Text("Home")
                }
                .tag(AppStage.home)
            Text("222")
                .tabItem {
                    Image("search")
                        .renderingMode(.template)

                    Text("Browse")
                }
                .tag(AppStage.browse)
            Text("222")
                .tabItem {
                    Image("store")
                        .renderingMode(.template)

                    Text("Store")
                }
                .tag(AppStage.store)
            OrderHistoryRoot()
                .tabItem {
                    Image("order")
                        .renderingMode(.template)

                    Text("Order History")
                }
                .tag(AppStage.order)
            ProfileRoot()
                .tabItem {
                    Image("profile")
                        .renderingMode(.template)

                    Text("Profile")
                }
                .tag(AppStage.profile)
        }
        .accentColor(.mainColor)
    
        
//        OnboardForm()
        
//        VStack {
//
//            AuthForm()
            
//            ProductImage(url: "https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg")
//
//            Text("Turtle Rock")
//                .font(Font.custom("Montserrat-SemiBold", size: 22))
//                .foregroundColor(.mainColor)
//                .padding()

//            Text("Turtle Rock")
//                .font(Font.custom("Montserrat-Light", size: 22))
//                .foregroundColor(Color(red: 0, green: 0, blue: 0xFF))
//                .padding()
//
//            Text("Turtle Rock")
//                .font(Font.custom("Montserrat-Regular", size: 22))
//                .foregroundColor(Color(red: 0, green: 0, blue: 0xFF))
//                .padding()
//
//            Text("Turtle Rock")
//                .font(Font.custom("Montserrat-Medium", size: 22))
//                .foregroundColor(Color(red: 0, green: 0, blue: 0xFF))
//                .padding()
//
//            Text("Turtle Rock")
//                .font(Font.custom("Montserrat-SemiBold", size: 22))
//                .foregroundColor(Color(red: 0, green: 0, blue: 0xFF))
//                .padding()
//
//            Text("Turtle Rock")
//                .font(Font.custom("Montserrat-Bold", size: 22))
//                .foregroundColor(Color(red: 0, green: 0, blue: 0xFF))
//                .padding()
//
//            Text("Turtle Rock")
//                .font(Font.custom("Montserrat-ExtraBold", size: 22))
//                .foregroundColor(Color(red: 0, green: 0, blue: 0xFF))
//                .padding()
//
//            Text("Turtle Rock")
//                .font(Font.custom("Montserrat-Black", size: 22))
//                .foregroundColor(Color(red: 0, green: 0, blue: 0xFF))
//                .padding(8)
            
//            HStack {
//                Text("Joshua Tree National Park")
//                    .font(Font.custom("Montserrat-Regular", size: 18))
//
//                Spacer()
//
//                Text("California")
//            }.padding()
//        }
//        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")

        ContentView()
            .previewDevice("iPad mini (6th generation)")
    }
}

