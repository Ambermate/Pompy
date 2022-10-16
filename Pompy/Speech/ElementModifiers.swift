//
//  ElementModifiers.swift
//  Pompy
//
//  Created by Long Hai on 10/15/22.
//

import Foundation
import SwiftUI

struct Features: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 35, height: 35, alignment: .center)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
//            .font(.system(size: 40))
        
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}


extension View {
    func FeauturesButton() -> some View {
        modifier(Features())
    }
}
