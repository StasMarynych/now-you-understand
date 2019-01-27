//
//  MainGameScene.swift
//  GlobalGameJam
//
//  Created by Стас on 1/26/19.
//  Copyright © 2019 Стас. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class MainGameScene: SKScene {
    private var spinnyNode : SKShapeNode?
    override func didMove(to view: SKView) {
        //addHouse()
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "backLabel" {
                let transition:SKTransition = SKTransition.crossFade(withDuration: 0.7)
                let scene: SKScene = GameScene(fileNamed: "GameScene")!
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            
            }
            if name == "lowerHouse" {
                let transition:SKTransition = SKTransition.fade(withDuration: 0.7)
                let scene: SKScene = Challange1(fileNamed: "Challange1")!
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            }
            
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.white
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.purple
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.white
            self.addChild(n)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    }
    

    
    
    
//    func addHouse() {
//        let addHouse = SKSpriteNode(texture: SKTexture.init(imageNamed: "lowerHouse"))
//        anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        addHouse.position = CGPoint.zero
//        addChild(addHouse)
//    }
    


