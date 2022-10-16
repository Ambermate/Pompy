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
    @State private var image: UIImage = UIImage(systemName: "scribble.variable")!
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var controlModel: ViewControlModel
    var body: some View {
        ZStack {
            VStack {
                Image.init(uiImage: image).resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action: {
                    self.iShown.toggle()
                    self.sourceType = .camera
                }) {
                    Text("Camera")
                }
                //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading, 10)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .cornerRadius(20)
                .tint(.black.opacity(1))
                .padding()
                .padding(.top, 10)
                
                Button(action: {
                    viewModel.uploadMainImage(image, "image")
                }) {
                    Text("Analyze")
                }
            }
            .sheet(isPresented: $iShown) {
                //
                Access(iShown: self.$iShown, myImage: self.$image, mySourceType: self.$sourceType)
        }
            VStack {
                Button(action: {controlModel.isShowingEating = false}) {
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

struct Access: UIViewControllerRepresentable {
    
    @Binding var iShown: Bool
    @Binding var myImage: UIImage
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

//struct Camera_Previews: PreviewProvider {
//    static var previews: some View {
//        //Camera()
//    }
//}
