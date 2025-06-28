//
//  SettingVC.swift
//  FinalProject
//
//  Created by Jenna Nega on 12/3/24.
//

import SwiftUI
struct SettingVC: View {
    @State private var isLight: Bool = false
    @State private var isLarge: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 100)
                Text("Settings")
                    .font(.custom("Impact", size: isLarge ? 70 : 50))
                    .foregroundColor(.black)
                    .padding(55)
                Spacer()
                // first toggle
                HStack {
                    Spacer(minLength: 30) // space between "Dark" and the toggle
                    Toggle(isOn: $isLight) {
                        Text("Dark Mode")
                            .font(.custom("Impact", size: isLarge ? 25 : 20))
                            .foregroundColor(.black)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .black))
                    Spacer(minLength: 34) // Space between the toggle and "Light"
                    Text("Light Mode")
                        .font(.custom("Impact", size: isLarge ? 23 : 20))
                        .foregroundColor(.black)
                    Spacer(minLength: 20)
                }
                .padding()
                
                HStack {
                    Spacer(minLength: 30) // space between "Dark" and the toggle
                    Toggle(isOn: $isLarge) {
                        Text("Normal Font")
                            .font(.custom("Impact", size: isLarge ? 23 : 20))
                            .foregroundColor(.black)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .black))
                    Spacer(minLength: 35) // Space between the toggle and "Light"
                    Text("Large Font")
                        .font(.custom("Impact", size: isLarge ? 25 : 20))
                        .foregroundColor(.black)
                    Spacer(minLength: 20)
                }
            
                .padding()
                Spacer(minLength: 100)
                Image("indigo")
                    .resizable() // Make the image resizable
                    .scaledToFit() // Maintain the aspect ratio while fitting within the frame
                    .frame(width: 200, height: 200) // Set the desired width and height
                    .padding()
                Spacer(minLength: 200)
                
            }
            .background(isLight ? Color.white : Color.indigo)

        }
        
    }
}

#Preview {
    SettingVC()
}
