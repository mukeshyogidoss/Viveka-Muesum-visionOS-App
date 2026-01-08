//
//  ContentView.swift
//  MuseumDemo
//
//  Created by Intern on 03/01/26.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace123
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace123
    @Environment(\.dismissWindow) var dismissWindow123
    
    
    @Environment(\.openWindow) var openWindow123
    @EnvironmentObject private var appState : AppState

    
    let bgMainColor1 = Color(red: 227/255, green: 217/255, blue: 195/255)
    let bgMainColor2 = Color(red: 235/255, green: 221/255, blue: 190/255)
    let bgMainColor3 = Color(red: 179/255, green: 164/255, blue: 127/255)


    let headerTxtColor = Color(red: 102/255, green: 87/255, blue: 60/255)





    var body: some View {
        GeometryReader {geo in
            let width = geo.size.width
            let height = geo.size.height
                ZStack{
                    LinearGradient(
                        colors: [bgMainColor1, bgMainColor2 , bgMainColor3],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                
                VStack {
                    Text("Welcome to Vivekananda Museum ")
                        .font(.largeTitle)
                        .foregroundColor(headerTxtColor)
                    
                    
                    Image("Holy Trio")
                        .resizable()
                        .scaledToFit()
                        .frame(width : width * 0.40 , height : height * 0.400 )
                    //                    .background(.gray)
                    
                    Text("Step into the Vivekananda Museum in 3D. Explore, interact, and experience its heritage like never before.")
                        .frame(width : width * 0.5)
                        .font(.system(size: width * 0.020))
                        .multilineTextAlignment(.center)
                        .foregroundColor(headerTxtColor)
                    
                    
                    
                    Button(appState.isMuesumOpen ? "Close Museum" : "Open Museum"){
                        Task{
                            if appState.isMuesumOpen{
                                await dismissImmersiveSpace123()
                                
                                appState.isMuesumOpen = false
                            }
                            else{
                                let result = await openImmersiveSpace123(id : "virtualMuesum")
                                
                                
                                openWindow123(id : "CloseImmersiveBtn")
                                
                                if result == .opened{
                                    appState.isMuesumOpen = true
                                    dismissWindow123()
                                }
                            }
                        }
                    }
                    
                    
                }
                .padding()
                
                    
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
    
}
