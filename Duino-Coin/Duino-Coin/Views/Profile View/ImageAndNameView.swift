//
//  ImageAndNameView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/8/21.
//

import SwiftUI

// MARK: - Image And Name View
struct ImageAndNameView: View {
    
    // MARK: - Properties
    @AppStorage("loggedIn") var loggedIn: Bool?
    @State private var showingAbout = false
    
    // body
    var body: some View {
        // vstack
        VStack {
            // groupbox
            GroupBox {
                // vstack
                VStack {
                    // image
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .font(Font.title.weight(.thin))
                        .foregroundColor(.customOrange)
                        .padding()
                    
                    // text
                    Text(UserDefaults.standard.string(forKey: "username") ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    
                    // ᕲ balance
                    Text("\(UserDefaults.standard.double(forKey: "ducoBalance").round(to: 8)) ᕲ")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(.customOrange)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    
                } //: vstack
                .frame(maxWidth: .infinity)
                
                Spacer()
                
            } //: groupbox
            .padding(10)
            
            Spacer()
            
            // groupbox
            GroupBox {
                // vstack
                VStack(spacing: 25) {
                    // button
                    Button {
                        // show about
                        self.showingAbout = true
                    } label: {
                        // hstack
                        HStack {
                            
                            Spacer()
                            
                            Text("About")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.customOrange)
                                .frame(height: 20, alignment: .center)
                                .padding()
                            
                            Spacer()
                            
                        } //: hstack
                        .cornerRadius(10)
                    } //: button
                    .alert("What is Duino-Coin?", isPresented: $showingAbout) {
                        Button("Hide", role: .cancel) { }
                    } message: {
                        Text("Duino-Coin is a coin that can be mined with Arduinos, ESP8266/32 boards, Raspberry Pis, computers, and many more (including Wi-Fi routers, smart TVs, smartphones, smartwatches, SBCs, MCUs or even GPUs.\n\nMore: https://duinocoin.com/")
                    }
                    
                    
                    // button
                    Button {
                        // logout operation
                        self.loggedIn = false
                    } label: {
                        // hstack
                        HStack {
                            
                            Spacer()
                            
                            Text("Logout")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(height: 20, alignment: .center)
                                .padding()
                            
                            Spacer()
                        } //: hstack
                        .background(Color.customOrange)
                        .cornerRadius(10)
                    } //: button
                } //: vstack
                .frame(maxWidth: .infinity)
            } //: groupbox
            .padding(10)
            
            //Spacer()
            
            // hstack
            HStack {
                // vstack
                VStack {
                    
                    Text("Developed by Fahim from 🇧🇩")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .frame(height: 20, alignment: .center)
                        .padding([.horizontal, .top])
                    
                } //: vstack
            } //: hstack
            .frame(maxWidth: .infinity)
            .padding(10)
        } //: vstack
    } //: body
}


// MARK: - Preview
struct ImageAndNameView_Previews: PreviewProvider {
    static var previews: some View {
        ImageAndNameView()
    }
}
