//
//  Home.swift
//  Pompy
//
//  Created by Long Hai on 10/15/22.
//

import SwiftUI
import WebKit
import ImageIO

struct Home: View {
    var n = Int.random(in: 1...4)
    var body: some View {
        ZStack {
            VStack {
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
            }
            
            VStack {
                Spacer().frame(height: 200)
                GifImage("fluffy\(n)")
                
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Button(action: {}) {
                        Image("location")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                    }
                    
                    Button(action: {}) {
                        Image("chat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                    }
                    
                    Button(action: {}) {
                        Image("eating")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                        
                    }
                    
                    Button(action: {}) {
                        Image("tree")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                    }
                    
                    Button(action: {}) {
                        Image("roadmap")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                    }
                }
                .padding(.bottom, 60)

            }

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
