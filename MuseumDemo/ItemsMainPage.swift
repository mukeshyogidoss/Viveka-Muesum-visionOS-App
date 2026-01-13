//
//  ItemsMainPage.swift
//  MuseumDemo
//
//  Created by Intern on 09/01/26.
//

import SwiftUI
import Combine

struct ItemsMainPage: View {
    @EnvironmentObject  var appState : AppState
    @EnvironmentObject   var selectedItem123 :  SelectedItem
    
   
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace123
    @Environment(\.dismissWindow) var dismissWindow123
    @Environment(\.openWindow) var openWindow123
   
    
    
   
    var body: some View {
        
        VStack{
            Button("Cat"){
              
                    selectedItem123.selectedItem = "Cat"
                    openWindow123(id : "Seperate3DObject" )
               
            }
            
            Button("Chamelon"){
            
                    selectedItem123.selectedItem = "Chamelon"
                    openWindow123(id : "Seperate3DObject" )
                
            }
            
            Button("Sea Horse"){
               
                    selectedItem123.selectedItem = "seaHorse"
                    openWindow123(id : "Seperate3DObject" )
                }
            
            
            Button("Soccer"){
            
                    selectedItem123.selectedItem = "soccer"
                    openWindow123(id : "Seperate3DObject" )
               
            }
            .padding(.bottom , 100)

            
            
            Button(appState.isMuesumOpen ? "Close Museum" : "Open Museum") {
               
                Task{
                    if appState.isMuesumOpen{
                        await dismissImmersiveSpace123()
                        
                        appState.isMuesumOpen = false
                        
                    }
                }
                
            }
        }
        
        
    }
}

#Preview {
    ItemsMainPage()
}
