//
//  ContentView.swift
//  HackHarvard
//
//  Created by Brayton Lordianto on 10/14/22.
//

import SwiftUI
import Foundation
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
        let anchor = AnchorEntity()
        let parentEntity = ModelEntity()
        let entity = try! Entity.load(named: "jump1")
        parentEntity.addChild(entity)
        anchor.scale = [0.5,0.5,0.5]
        anchor.addChild(parentEntity)
        print("DEBUG: \(entity.availableAnimations.count)")
        arView.scene.addAnchor(anchor)
        for anim in entity.availableAnimations {
            print("DEBUG: hi")
            entity.playAnimation(anim.repeat())
        }
        let entityBounds = entity.visualBounds(relativeTo: parentEntity)
        parentEntity.collision = CollisionComponent(shapes: [ShapeResource.generateBox(size: entityBounds.extents).offsetBy(translation: entityBounds.center)])

        arView.installGestures(for: parentEntity)

        // Add the box anchor to the scene
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
