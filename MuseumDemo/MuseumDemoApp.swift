//
//  MuseumDemoApp.swift
//  MuseumDemo
//
//  Created by Intern on 03/01/26.
//

import SwiftUI
import Combine

@main
struct MuseumDemoApp: App {

    @StateObject private var  selectedItem123 = SelectedItem()
    @StateObject private var appState = AppState()
   

    var body: some Scene {
        WindowGroup {
            if appState.isMuesumOpen {
                ItemsMainPage()
                    .environmentObject(selectedItem123)
                    .environmentObject(appState)
                
            }
            else{
                ContentView()
                    .environmentObject(appState)
            }
        }
        .defaultSize(
            width : 900 , height : 900
        )
        
        
        
        
        
        
        ImmersiveSpace(id : "virtualMuesum"){
            Muesum()
                .environmentObject(appState)
        }
        .immersionStyle(selection: .constant(.full))
        
       
        
       
        
        WindowGroup(id : "Seperate3DObject"){
            
            Seperate3DObject()
                .environmentObject(selectedItem123)
                .environmentObject(appState)
        }
        .windowStyle(.volumetric)
        .defaultSize(width : 2 , height : 1 , depth:  1 , in : .meters)
//        .environmentObject(selectedItem123)
//        .environmentObject(appState)
    }
}
