//
//  Camera.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import SwiftUI
import UIKit


struct Camera: View {
    @State private var iShown: Bool = false
    @State private var image: Image = Image("")
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    var body: some View {
        VStack {
            image.resizable()
                .aspectRatio(contentMode: .fit)
            
            Button(action: {
                self.iShown.toggle()
                self.sourceType = .camera
            }) {
                Text("Camera")
            }
        }
        .fullScreenCover(isPresented: $iShown) {
            //
            Access(iShown: self.$iShown, myImage: self.$image, mySourceType: self.$sourceType)
        }
    }
}

struct Access: UIViewControllerRepresentable {
    
    @Binding var iShown: Bool
    @Binding var myImage: Image
    @Binding var mySourceType: UIImagePickerController.SourceType
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Access>) {
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Access>) -> UIImagePickerController {
        let obj = UIImagePickerController()
        obj.sourceType = mySourceType
        obj.delegate = context.coordinator
        return obj
    }
    
    func makeCoordinator() -> Choose {
        return Choose(isShown: $iShown, myImage: $myImage)
    }
}

struct Camera_Previews: PreviewProvider {
    static var previews: some View {
        Camera()
    }
}
