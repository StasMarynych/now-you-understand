//
//  Challanges.swift
//  GlobalGameJam
//
//  Created by Стас on 1/26/19.
//  Copyright © 2019 Стас. All rights reserved.
//

import UIKit
import SpriteKit

class Challange1: SKScene {
    
    override func didMove(to view: SKView) {
        let multiLable = SKMultilineLabel(text: "I think that home is the place where I can be with the people that I just care about the most. And this is not only about relative but about my friends too. So I offer you to make this tasks to make your relationships with your important people better.", labelWidth: 700, pos: CGPoint(x: size.width/68, y: size.height/2.7), fontName: "Helvetica Neue UltraLight", fontSize: 46.5, fontColor: UIColor.white)
        self.addChild(multiLable)
        let challange1 = SKMultilineLabel(text: "Make a diner for your family and spend some time with them", labelWidth: 700, pos: CGPoint(x: 0.5, y: size.height/24), fontName: "Helvetica Neue Thin Italic", fontSize: 45, fontColor: UIColor.white)
        self.addChild(challange1)
        let challange2 = SKMultilineLabel(text: "Give your smile to 10 different people who you don't know", labelWidth: 700, pos: CGPoint(x: 0.5, y: -size.height/4), fontName: "Helvetica Neue Thin Italic", fontSize: 45, fontColor: UIColor.white)
        self.addChild(challange2)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "backLabel" {
                let transition:SKTransition = SKTransition.crossFade(withDuration: 0.7)
                let scene: SKScene = MainGameScene(fileNamed: "MainGameScene")!
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
                
            }
            
//            if name == "condition" {
//                childNode(withName: name)
//            }
//
//            if name == "invisibleSprite" {
//                print(123)
//            }
            
            
            
        }
        
    }
    
    
}

//func childNode(withName: String) {
//
//    SKSpriteNode.init(fileNamed: withName)?.texture?.applying(CIFilter.init(name: "1stRoom")!)
//}


