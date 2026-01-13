//
//  GlobalSelectedItem.swift
//  MuseumDemo
//
//  Created by Intern on 09/01/26.
//

import SwiftUI
import Combine


class SelectedItem : ObservableObject{
    @Published var selectedItem : String? = nil
}
