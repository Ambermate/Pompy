//
//  Response.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.volume = 20.0
            audioPlayer?.play()
            //audioPlayer?.numberOfLoops = -1
            
            print("playing ", sound, " ", type)
            
        } catch let error {
            print(error)
        }
    }
}
