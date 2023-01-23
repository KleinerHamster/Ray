//
//  Scene.swift
//  Ray
//
//  Created by Виктория Ивашова on 22.01.2023.
//

import MetalKit

class Scene: Node {
  var device: MTLDevice
  var size: CGSize
  
  init(device: MTLDevice, size: CGSize) {
    self.device = device
    self.size = size
    super.init()
  }
}
