//
//  Model.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import Foundation
import SwiftUI

class Choose: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding var isShown: Bool
    @Binding var myImage: Image
    
    init(isShown: Binding<Bool>, myImage: Binding<Image>) {
        _isShown = isShown
        _myImage = myImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print(image)
            myImage = Image.init(uiImage: image)
        }
        isShown = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}
