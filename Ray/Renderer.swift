//
//  Renderer.swift
//  Ray
//
//  Created by Виктория Ивашова on 21.01.2023.
//

import Foundation
import MetalKit

class Renderer: NSObject{
    let device: MTLDevice
    let commandQueue: MTLCommandQueue
    
    var scene: Scene?
    var samplerState: MTLSamplerState?
    
    
    init (device: MTLDevice) {
            self.device = device
            commandQueue = device.makeCommandQueue()!
            super.init()
            buildSamplerState()
    }
    
    private func buildSamplerState() {
      let descriptor = MTLSamplerDescriptor()
      descriptor.minFilter = .linear
      descriptor.magFilter = .linear
      samplerState = device.makeSamplerState(descriptor: descriptor)
    }
}

extension Renderer: MTKViewDelegate{
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              //let pipelineState = pipelineState,
              let descriptor = view.currentRenderPassDescriptor else { return }
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        let commandEncoder=commandBuffer?.makeRenderCommandEncoder(descriptor: descriptor)
        commandEncoder?.setFragmentSamplerState(samplerState, index: 0)
        
//        один треугольник
//        commandEncoder?.drawPrimitives(type: .triangle,
//                                      vertexStart: 0,
//                                      vertexCount: vertices.count)
        
        let deltaTime = 1 / Float(view.preferredFramesPerSecond)
        scene?.render(commandEncoder: commandEncoder!,
                      deltaTime: deltaTime)

        
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
