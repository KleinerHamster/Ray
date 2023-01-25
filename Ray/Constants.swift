//
//  Constants.swift
//  Ray
//
//  Created by Виктория Ивашова on 25.01.2023.
//

import simd

struct ModelConstants1{
    var modelViewMatrix = matrix_identity_float4x4
}

struct SceneConstants1 {
    var projectionMatrix = matrix_identity_float4x4
}

enum FunctionName: String {
    case fragmentShader = "fragment_shader"
    case vertexShader = "vertex_shader"
    case texturedFragment = "textured_fragment"
}

