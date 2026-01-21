//
//  Muesum.swift
//  MuseumDemo
//
//  Created by Intern on 07/01/26.


import SwiftUI
import RealityKit
import RealityKitContent
import simd


struct Muesum: View {
    
    @State private var catModel: ModelEntity?
    var body: some View {
        RealityView{ content in
            let anchor = AnchorEntity()
            
            if let realMuseum = OwnMuseum(){
                content.add(realMuseum)
            }
            
            if let immersiveContentEntity = try? await Entity(
                named: "Child Table", in: realityKitContentBundle
            )
            {
                immersiveContentEntity.scale = SIMD3(repeating: 0.02)
                
                //Position Scale : [x, y, z]
                immersiveContentEntity.position = [-7,-3,-10]
                
                
                anchor.addChild(immersiveContentEntity)
            }
            content.add(anchor)
           
               
            
            
            
        }
    }
        
    }


private func OwnMuseum()-> Entity? {
    let outerSphere = MeshResource.generateSphere(radius: 200)
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
