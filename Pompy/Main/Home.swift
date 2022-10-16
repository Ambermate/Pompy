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
    @EnvironmentObject var controlModel: ViewControlModel
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
            .onTapGesture {
                controlModel.isShowingPompy = true
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Button(action: {controlModel.isShowingLocation = true}) {
                        Image("location")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                    }
                    
                    Button(action: {controlModel.isShowingChat = true}) {
                        Image("chat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                    }
                    
                    Button(action: {controlModel.isShowingEating = true}) {
                        Image("eating")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                        
                    }
                    
                    Button(action: {controlModel.isShowingTree = true}) {
                        Image("tree")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                    }
                    
                    Button(action: {controlModel.isShowingRoadmap = true}) {
                        Image("roadmap")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .FeauturesButton()
                    }
                }
                .padding(.bottom, 60)

            }

        }
        .fullScreenCover(isPresented: $controlModel.isShowingChat, onDismiss: {}) {
            Chat()
        }
        .fullScreenCover(isPresented: $controlModel.isShowingTree, onDismiss: {}) {
            ZStack {
                NatureView()
                
                VStack {
                    Button(action: {controlModel.isShowingTree = false}) {
                        Image(systemName: "xmark")
                            .font(.system(size: 40))
                            .padding(.horizontal, 3)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 10)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .cornerRadius(20)
                    .tint(.black.opacity(1))
                    .padding()
                    .padding(.top, 10)
                }
            }
        }
        .fullScreenCover(isPresented: $controlModel.isShowingEating, onDismiss: {}) {
            Camera()
        }
        .fullScreenCover(isPresented: $controlModel.isShowingRoadmap, onDismiss: {}) {
            RoadMap()
        }
        .fullScreenCover(isPresented: $controlModel.isShowingLocation, onDismiss: {}) {
            ZStack {
                MapView()
                
                VStack {
                    Button(action: {controlModel.isShowingLocation = false}) {
                        Image(systemName: "xmark")
                            .font(.system(size: 40))
                            .padding(.horizontal, 3)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 10)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .cornerRadius(20)
                    .tint(.black.opacity(1))
                    .padding()
                    .padding(.top, 40)
                }
            }
        }
        .fullScreenCover(isPresented: $controlModel.isShowingPompy, onDismiss: {}) {
            ZStack {
                BasicPompiView()
                
                VStack {
                    Button(action: {controlModel.isShowingPompy = false}) {
                        Image(systemName: "xmark")
                            .font(.system(size: 40))
                            .padding(.horizontal, 3)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 10)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .cornerRadius(20)
                    .tint(.black.opacity(1))
                    .padding()
                    .padding(.top, 10)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
