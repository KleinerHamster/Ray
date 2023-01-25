//
//  Extensions.swift
//  Ray
//
//  Created by Виктория Ивашова on 25.01.2023.
//

import Foundation
import MetalKit

extension MTLVertexDescriptor{
    static func defaultVertexDescriptor() -> MTLVertexDescriptor{
        let vertexDescriptor = MTLVertexDescriptor()
        vertexDescriptor.attributes[0].format =   .float3
        vertexDescriptor.attributes[0].offset = 0
        vertexDescriptor.attributes[0].bufferIndex = 0
        
        vertexDescriptor.attributes[1].format =   .float3
        vertexDescriptor.attributes[1].offset = MemoryLayout<SIMD3<Float>>.stride
        vertexDescriptor.attributes[1].bufferIndex = 0
        
        vertexDescriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
        
        return vertexDescriptor
    }
}

extension MDLVertexDescriptor{
    static func defaultVertexDescriptor() -> MDLVertexDescriptor{
        let vertexDescriptor = MTKModelIOVertexDescriptorFromMetal(.defaultVertexDescriptor())
        
        let attrivutePosition = vertexDescriptor.attributes[0] as! MDLVertexAttribute
        attrivutePosition.name = MDLVertexAttributePosition
        
        return vertexDescriptor
    }
}
