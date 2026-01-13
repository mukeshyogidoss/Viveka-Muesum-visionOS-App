//
//  Seperate3DObject.swift
//  MuseumDemo
//
//  Created by Intern on 10/01/26.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct Seperate3DObject: View {
    // Get the selected item from the shared environment object
    @EnvironmentObject var selectedItem123: SelectedItem
    
    // Optional: For rotation/scale gestures
    @State private var rotateBy: Double = 0
    @State private var sceneEntity: Entity?
    @State private var rotationX: Float = 0
    @State private var rotationY: Float = 0
    @State private var scale: Double = 1.0
    @State private var startScale: Double? = nil

    var body: some View {
        VStack {
            if let item = selectedItem123.selectedItem {
                MuesumItems(Items: item) // pass the selected item dynamically
            } else {
                Text("No 3D model selected")
                    .foregroundColor(.white)
            }
        }
        .padding3D(.top , 20)
        
    }
}

