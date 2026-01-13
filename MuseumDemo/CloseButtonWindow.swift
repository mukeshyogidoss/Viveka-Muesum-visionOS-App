//
//  CloseButtonWindow.swift
//  MuseumDemo
//
//  Created by Intern on 08/01/26.
//

import SwiftUI

struct CloseButtonWindow: View {
    @EnvironmentObject private var appState : AppState
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace123
    
    @Environment(\.dismissWindow) var dismissWindow123
    
    var body: some View {
        Button("Closeee the Immersive "){
            Task{
                
                appState.isMuesumOpen.toggle()
                await  dismissImmersiveSpace123()
                dismissWindow123(id : "CloseImmersiveBtn")
                 
            }
        }
        .background(.red)
    }
}

#Preview {
    CloseButtonWindow()
}
