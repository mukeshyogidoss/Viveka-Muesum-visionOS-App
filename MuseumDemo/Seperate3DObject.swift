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


    var body: some View {
        VStack {
            if let item = selectedItem123.selectedItem {
                MuesumItems(Items: item) // pass the selected item dynamically
            }
        }
        .padding3D(.top , 20)
        
    }
}

