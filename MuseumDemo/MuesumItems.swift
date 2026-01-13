//
//  MuesumItems.swift
//  MuseumDemo
//
//  Created by Intern on 09/01/26.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct MuesumItems: View {
    var Items : String
    
    @EnvironmentObject private var appState: AppState
    @State private var rotateBy : Double = 0.0
    
    //For moving vertical and horizontal
    @State private var sceneEntity: Entity?
    @State private var rotationX: Float = 0
    @State private var rotationY: Float = 0
    
    //For Pinching
    @State var scale : Double = 1.0
    @State var startScale : Double? = nil
    
    
    
    
    var body: some View {
       
        
        RealityView{content in
            
            do{
                let entity = try await Entity.init(named : Items , in : realityKitContentBundle)
                entity.scale *= SIMD3<Float>(repeating: 1.6) // repeating means it applies for all x, y , z
                entity.generateCollisionShapes(recursive: true)
                
                entity.components.set(InputTargetComponent())
                content.add(entity)
                
                sceneEntity = entity
            }
            catch{
                print(error )
            }
        }
        
        .padding3D(EdgeInsets3D(top : 900 , bottom : 200 , front : 100))
            .padding(.bottom , 400)
        
        
//        .background(.red)
        .rotation3DEffect(.radians(rotateBy) , axis: .x)
        .gesture(
            DragGesture(minimumDistance:  0.0)
                .targetedToAnyEntity()
                .onChanged{ value in
                    
                    
                    guard let entity = sceneEntity else { return }
                    
                    // horizontal drag → Y rotation (left/right)
                    let deltaY = Float(value.translation.width) * 0.0002
                    // vertical drag → X rotation (up/down)
                    let deltaX = Float(value.translation.height) * -0.0002
                    
                    rotationY += deltaY
                    rotationX -= deltaX
                    
                    // Optional: clamp X rotation to prevent flipping
                    //                                rotationX = min(max(rotationX, -Float.pi/2), Float.pi/2)
                    
                    // Combine rotations
                    let rotY = simd_quatf(angle: rotationY, axis: SIMD3<Float>(0,1,0))
                    let rotX = simd_quatf(angle: rotationX, axis: SIMD3<Float>(1,0,0))
                    entity.transform.rotation = rotY * rotX
                    
                }
        )
        
        .scaleEffect(scale)
        .simultaneousGesture(
            MagnifyGesture()
                .onChanged({value in
                    if let startScale {
                        scale = max(0.5 , min(5 , value.magnification  * startScale))
                    }
                    else{
                        startScale = scale
                    }
                    
                })
                .onEnded({ _ in
                    startScale = scale
                })
            
        );
        
        
    }
      
      
    
    
    
    
    

    
    
}

#Preview {
    MuesumItems(Items: "Cat.usdz")
}
