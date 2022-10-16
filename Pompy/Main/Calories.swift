//
//  Calories.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import SwiftUI

struct Calories: View {
    @EnvironmentObject var controlModel: ViewControlModel
    var body: some View {
        ZStack {
            Color(UIColor(named: "yellowish")!)
            
            VStack {
                Text("It's")
                    .font(.system(size: 70))
                Image("apple")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                
                Text("Apple")
                    .font(.system(size: 70))
                Text("102kcal")
                    .font(.system(size: 70))
            }
            
            VStack {
                Button(action: {controlModel.isShowingAnalyze = false}) {
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
                .padding(.top, 20)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct Calories_Previews: PreviewProvider {
    static var previews: some View {
        Calories()
    }
}
