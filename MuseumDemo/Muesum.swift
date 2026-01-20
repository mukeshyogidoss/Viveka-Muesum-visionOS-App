//
//  Muesum.swift
//  MuseumDemo
//
//  Created by Intern on 07/01/26.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Muesum: View {
    // State to hold the loaded Cat model
      @State private var catModel: ModelEntity?
    var body: some View {
        RealityView{ content in
            			
            
            if let realMuseum = OwnMuseum(){
                content.add(realMuseum)
                
            }
            
            if let immersiveContentEntity = try? await Entity(named: "Bear", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

                
            }
        }
    }
        
    }


private func OwnMuseum()-> Entity? {
    let outerSphere = MeshResource.generateSphere(radius: 20)
    var museumMaterial = UnlitMaterial()
    
    do{
        let texture  = try TextureResource.load(named : "Museum Hall")
        museumMaterial.color = .init(
                    tint: UIColor(white: 1.5, alpha: 1.0), // brighten here
                   texture: .init(texture)
                  
        )
    }
    catch{
        print("Failed to load Museum Image")
        return nil
    }
    
    let museumEntity = Entity()
    museumEntity.components.set(ModelComponent(mesh : outerSphere , materials: [museumMaterial]))
    museumEntity.scale = .init(x:-1 , y:1 , z:1)
    
    return museumEntity
}

#Preview {
    Muesum()
}
