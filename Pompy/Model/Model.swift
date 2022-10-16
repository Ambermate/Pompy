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
    @Binding var myImage: UIImage
    @EnvironmentObject var viewModel: ViewModel
    //var photo: UIImage
    
    init(isShown: Binding<Bool>, myImage: Binding<UIImage>) {
        _isShown = isShown
        _myImage = myImage
        
        //photo = UIImage(systemName: "house")
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print(image)
//            photo = image
            myImage = image//Image.init(uiImage: image)
        }
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
        //viewModel.uploadMainImage(myImage, "image")
    }
}
