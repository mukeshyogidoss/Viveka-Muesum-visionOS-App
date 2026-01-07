//
//  MuseumDemoApp.swift
//  MuseumDemo
//
//  Created by Intern on 03/01/26.
//

import SwiftUI

@main
struct MuseumDemoApp: App {

    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        ImmersiveSpace(id : "virtualMuesum"){
            Muesum()
        }
        .immersionStyle(selection: .constant(.full))
    }
}
