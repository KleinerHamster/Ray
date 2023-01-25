//
//  GameSecene.swift
//  Ray
//
//  Created by Виктория Ивашова on 22.01.2023.
//

import MetalKit

class GameScene: Scene {
    
    let model: Model
    
    override init(device: MTLDevice, size: CGSize) {
        
        model = Model(device: device, modelName: "1234_aparat_stereo_glass")
        
        super.init(device: device, size: size)
        add(childNode: model)
      
        model.rotation.x -= 0.45
        model.rotation.y -= 0.367
        model.rotation.z -= 0.08
    }
}
