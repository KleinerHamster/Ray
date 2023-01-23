//
//  GameSecene.swift
//  Ray
//
//  Created by Виктория Ивашова on 22.01.2023.
//

import MetalKit

class GameScene: Scene {

  var quad: Plane

  override init(device: MTLDevice, size: CGSize) {
    quad = Plane(device: device)
    super.init(device: device, size: size)
    add(childNode: quad)
  }
}
