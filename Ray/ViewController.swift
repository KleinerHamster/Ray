//
//  ViewController.swift
//  Ray
//
//  Created by Виктория Ивашова on 21.01.2023.
//

import Cocoa
import MetalKit

enum Colors{
    static let wenderlichGreen = MTLClearColor(red: 0.4,
                                               green: 0.76,
                                               blue: 0.8,
                                               alpha: 1.0)
}
 
class ViewController: NSViewController {

    var metalView: MTKView{
        return view as! MTKView
    }
    
    var renderer: Renderer?
    
    override func viewDidLoad() {
      super.viewDidLoad()
      metalView.device = MTLCreateSystemDefaultDevice()
      guard let device = metalView.device else {
        fatalError("Device not created. Run on a physical device")
      }
      
        metalView.clearColor =  Colors.wenderlichGreen
        renderer = Renderer(device: device)
        renderer?.scene = GameScene(device: device, size: view.bounds.size)
        metalView.delegate = renderer
    }
}


