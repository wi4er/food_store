//
//  AuthForm.swift
//  Landmarks
//
//  Created by Maxik on 20.03.2022.
//

import SwiftUI


enum NotifyMeAboutType {
    case directMessages
    case mentions
    case anything
}

struct AuthForm: View {
    @State
    private var email: String = ""
    
    @State
    private var phone: String = ""
    
    @State
    private var password: String = ""
    
    var body: some View {
        VStack(spacing: 13) {
            TextInput(
                text: $email,
                placeholder: "Email",
                enable: phone.isEmpty
            )
                .frame(width: 320, height: 48)
            
            TextInput(
                text: $phone,
                placeholder: "Phone",
                enable: email.isEmpty
            )
                .frame(width: 320, height: 48)
            
            TextInput(text: $password, placeholder: "Password")
                .frame(width: 320, height: 48)
            
            CommonButton(
                color: .white,
                action: {}
            ) {
                Text("Login")
            }
            .padding(.top, 21)
        }
        .padding()
    }
}

struct AuthForm_Previews: PreviewProvider {
    static var previews: some View {
        AuthForm()
            .previewLayout(.fixed(width: 500, height: 500))
            .background(Color.green)
    }
}
