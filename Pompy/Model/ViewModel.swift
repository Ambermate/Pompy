//
//  ViewModel.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var Dialog: String = "" {
        didSet {
            print("changed to ", self.Dialog)
            playSound(sound: "bonjour", type: "mp3")
        }
    }
    
    init() {
//        let c: Any
//        $Dialog.sink { value in
//            print("changed to ", value)
//        }
    }
    
}
