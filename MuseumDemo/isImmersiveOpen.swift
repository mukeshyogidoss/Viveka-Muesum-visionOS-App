//
//  isImmersiveOpen.swift
//  MuseumDemo
//
//  Created by Intern on 08/01/26.
//

import SwiftUI
import Combine


@MainActor
final class AppState : ObservableObject {
    @Published var isMuesumOpen : Bool = false
    
}
