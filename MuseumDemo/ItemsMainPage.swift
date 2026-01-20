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
    
    func simpleButton(_ btnTitle: String, _ modelName: String) -> some View {
        Button(btnTitle) {
            selectedItem123.selectedItem = modelName
            openWindow123(id: "Seperate3DObject")
        }
       
    }

   
    
    
   
    var body: some View {
        
        VStack{


            
            simpleButton("Cat 🐱" , "Cat")
            simpleButton("Chamelon 🦎" , "Chamelon")
            simpleButton("Sea Horse 🐙" , "seaHorse")
            simpleButton("Soccer ⚽" , "soccer")
        
           
            .padding(.bottom , 100)
            
           

            
            
            Button(appState.isMuesumOpen ? "Close Museum" : "Open Museum") {
               
                Task{
                    if appState.isMuesumOpen{
                       
                        
                        appState.isMuesumOpen = false
                        selectedItem123.selectedItem = nil
                        
                        await dismissImmersiveSpace123()
                        
                        
                    }
                }
                
            }
        }
        
        
    }
}

#Preview {
    ItemsMainPage()
}
