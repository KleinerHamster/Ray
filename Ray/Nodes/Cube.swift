//
//  Cube.swift
//  Ray
//
//  Created by Виктория Ивашова on 24.01.2023.
//

import MetalKit

class Cube: Primitive {

  override func buildVertices() {
    vertices = [
        Vertex(position:  SIMD3<Float>(-0.5, 0.5, 0.5),   // 0 Front
             color:     SIMD4<Float>(1, 0, 0, 1),
             texture:   SIMD2<Float>(0, 0)),
      Vertex(position:  SIMD3<Float>(-0.5, -0.5, 0.5),  // 1
             color:    SIMD4<Float>(0, 1, 0, 1),
             texture:  SIMD2<Float>(0, 1)),
        Vertex(position: SIMD3<Float>(0.5, -0.5, 0.5),   // 2
             color:    SIMD4<Float>(0, 0, 1, 1),
             texture:  SIMD2<Float>(1, 1)),
      Vertex(position: SIMD3<Float>(0.5, 0.5, 0.5),    // 3
             color:    SIMD4<Float>(1, 0, 1, 1),
             texture:  SIMD2<Float>(1, 0)),
      
      Vertex(position: SIMD3<Float>(-0.5, 0.5, -0.5),  // 4 Back
             color:    SIMD4<Float>(0, 0, 1, 1),
             texture:  SIMD2<Float>(1, 1)),
      Vertex(position: SIMD3<Float>(-0.5, -0.5, -0.5), // 5
             color:    SIMD4<Float>(0, 1, 0, 1),
             texture:  SIMD2<Float>(0, 1)),
      Vertex(position: SIMD3<Float>(0.5, -0.5, -0.5),  // 6
             color:    SIMD4<Float>(1, 0, 0, 1),
             texture:  SIMD2<Float>(0, 0)),
      Vertex(position: SIMD3<Float>(0.5, 0.5, -0.5),   // 7
             color:    SIMD4<Float>(1, 0, 1, 1),
             texture:  SIMD2<Float>(1, 0)),
    ]
    
    indices = [
      0, 1, 2,     0, 2, 3,  // Front
      4, 6, 5,     4, 7, 6,  // Back

      4, 5, 1,     4, 1, 0,  // Left
      3, 6, 7,     3, 2, 6,  // Right

      4, 0, 3,     4, 3, 7,  // Top
      1, 5, 6,     1, 6, 2   // Bottom
    ]
  }
}

