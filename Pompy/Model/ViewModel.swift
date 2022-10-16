//
//  ViewModel.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import Foundation
import Combine
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

class ViewModel: ObservableObject {
    @Published var Dialog: String = "" {
        didSet {
            print("changed to ", self.Dialog)
            audioPlayer?.stop()
            playSound(sound: "bonjour", type: "mp3")
        }
    }
    @Published var currentUser = User()
    
    
    init() {
        self.fetchUser()
    }
    
    //-- fetching User
    func fetchUser() {
        
        let docRef = Firestore.firestore().collection("Demo").document("user1")
        
        docRef.addSnapshotListener { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                
                    self.currentUser.imageURL = data["imageURL"] as? String ?? "image"

                }
            }
        }
    }
    
    internal func uploadMainImage(_ image: UIImage, _ location: String) {
        ImageUploader.uploadImage(image: image, location: location, filename: NSUUID().uuidString) { imageURL in
            Firestore.firestore().collection("User")
                .document("Demo") //-- in the group id access
                .updateData(["imageURL": imageURL]) { _ in
                    //
                }
        }
    }
    
}
