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
 
//            MuesumItems(Items: "Cat")
//                .environmentObject(selectedItem123)
//                .environmentObject(appState)
//      
               
        }
        .windowStyle(.volumetric)
        .defaultSize(width : 1 , height : 0.6 , depth:  0.8 , in : .meters)
//        .environmentObject(selectedItem123)
//        .environmentObject(appState)
    }
}
