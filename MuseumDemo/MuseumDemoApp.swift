//
//  MuseumDemoApp.swift
//  MuseumDemo
//
//  Created by Intern on 03/01/26.
//

import SwiftUI

@main
struct MuseumDemoApp: App {

    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
        .defaultSize(
            width : 900 , height : 800
        )
        
        ImmersiveSpace(id : "virtualMuesum"){
            Muesum()
                .environmentObject(appState)
        }
        .immersionStyle(selection: .constant(.full))
        
        WindowGroup(id : "CloseImmersiveBtn"){
            CloseButtonWindow()
                .environmentObject(appState)
        }
        .windowStyle(.volumetric)
        .defaultSize(width : 1 , height : 0.7 , depth:  1 , in : .meters)
        .environmentObject(appState)
    }
}
