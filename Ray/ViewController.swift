//
//  ViewController.swift
//  Ray
//
//  Created by Виктория Ивашова on 21.01.2023.
//

import Cocoa
import MetalKit

enum Colors{
    static let wenderlichGreen = MTLClearColor(red: 0.25,
                                               green: 0.76,
                                               blue: 0.8,
                                               alpha: 1.0)
}

class ViewController: NSViewController {

    var metalView: MTKView{
        return view as! MTKView
    }
    
    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metalView.device = MTLCreateSystemDefaultDevice()
        device = metalView.device
        
        metalView.clearColor = Colors.wenderlichGreen
        metalView.delegate = self
        commandQueue = device.makeCommandQueue()
        
    }
}

extension ViewController: MTKViewDelegate{
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize){
        
    }
    func draw(in view: MTKView) {
        guard let drawble = view.currentDrawable,
              let descriptor = view.currentRenderPassDescriptor else{
            return }
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: descriptor)
        
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawble)
        commandBuffer?.commit()
    }
}


