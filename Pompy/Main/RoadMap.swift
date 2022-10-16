//
//  RoadMap.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import SwiftUI

struct RoadMap: View {
    var body: some View {
        ZStack {
            VStack {
                Image("mainbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
            }
            
            VStack {
                Button(action: { }) {
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

struct RoadMap_Previews: PreviewProvider {
    static var previews: some View {
        RoadMap()
    }
}
