//
//  ImageUploader.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, location: String, filename: String, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }

        //let ref = Storage.storage().reference(withPath: "/\(location)/\(filename)")
        let ref = Storage.storage().reference(withPath: "/\(location)/\(filename)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        ref.putData(imageData, metadata: metadata
        ) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageURL, _ in
                guard let imageURL = imageURL?.absoluteString else { return }
                completion(imageURL)
            }
        }
    }
}
