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
    
    let vertices: [Float] = [
        -0.5,0.5,0,//v0
         -0.5,-0.5,0,//v1
         0.5,-0.5,0,//v2
         0.5,0.5,0,//v3
    ]
    
    var indices: [UInt16] = [
        0,1,2,
        2,3,0
    ]

    var pipelineState:MTLRenderPipelineState?
    var vertexBuffer: MTLBuffer?
    var indexBuffer: MTLBuffer?
    
    
    init (device: MTLDevice) {
            self.device = device
            commandQueue = device.makeCommandQueue()!
            super.init()
            buildModel()
            buildPipelineState()
        
    }
    
    private func buildModel(){
            vertexBuffer=device.makeBuffer(bytes: vertices, length: vertices.count *
                                           MemoryLayout<Float>.size, options:[])
        indexBuffer = device.makeBuffer(bytes: indices, length: indices.count *
                                        MemoryLayout<UInt16>.size, options: [])
    }
    
    private func buildPipelineState(){
        let library=device.makeDefaultLibrary()
        let vertexFunction=library?.makeFunction(name: "vertex_shader")
        let fragmentFunction = library?.makeFunction(name: "fragment_shader")
        
        let pipelineDescriptor=MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction=vertexFunction
        pipelineDescriptor.fragmentFunction=fragmentFunction
        pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        do{
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        }catch let error as NSError{
            print("error: \(error.localizedDescription)")
        }
       
    }
}

extension Renderer: MTKViewDelegate{
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let pipelineState = pipelineState,
              let indexBuffer = indexBuffer,
              let descriptor = view.currentRenderPassDescriptor else { return }
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        let commandEncoder=commandBuffer?.makeRenderCommandEncoder(descriptor: descriptor)
        
       
        
        commandEncoder?.setRenderPipelineState(pipelineState)
        commandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        
        
//        один треугольник
//        commandEncoder?.drawPrimitives(type: .triangle,
//                                      vertexStart: 0,
//                                      vertexCount: vertices.count)

        commandEncoder?.drawIndexedPrimitives(type: .triangle,
                                              indexCount: indices.count,
                                              indexType: .uint16,
                                              indexBuffer: indexBuffer,
                                              indexBufferOffset: 0)
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}