//
//  HomeScene.swift
//  Bait
//
//  Created by Victor  Omiwole on 2016-07-21.
//  Copyright © 2016 test 1. All rights reserved.
//

import Foundation
import SpriteKit

class HomeScene: SKScene{
    
    
    let leftb = SKSpriteNode(imageNamed: "backl")
    
    override func didMoveToView(view: SKView) {
        
        leftb.position = CGPoint(x: self.size.width*0.1, y: self.size.height*0.35)
        leftb.zPosition = 2
        leftb.name = "leftButton"
        leftb.setScale(0.3)
        self.addChild(leftb)
        
        
        let spawn = SKAction.runBlock(particle)
        let waitToSpawn = SKAction.waitForDuration(20)
        let spawnSequence = SKAction.sequence([spawn, waitToSpawn])
        let spawnForever = SKAction.repeatActionForever(spawnSequence)
        self.runAction(spawnForever, withKey: "spawningEnemies")
        //spawns particles in title screen in a loop
        
        
        let background = SKSpriteNode(imageNamed: "gradientScreen1")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        background.setScale(2)
        self.addChild(background)
        
    }
    func particle(){
        
        
        let rain = SKEmitterNode(fileNamed: "MyParticle.sks")
        rain!.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        rain!.particleColor = SKColor.whiteColor()
        rain?.setScale(1)
        rain!.zPosition = 1
        self.addChild(rain!)
        
        
        let rain2 = SKEmitterNode(fileNamed: "MyParticle.sks")
        rain2!.position = CGPoint(x: self.size.width, y: self.size.height/2)
        rain2!.particleColor = SKColor.whiteColor()
        rain2?.setScale(1)
        rain2!.zPosition = 1
        self.addChild(rain2!)
        
        let rain3 = SKEmitterNode(fileNamed: "MyParticle.sks")
        rain3!.position = CGPoint(x: -self.size.width, y: self.size.height/2)
        rain3!.particleColor = SKColor.whiteColor()
        rain3?.setScale(1)
        rain3!.zPosition = 1
        self.addChild(rain3!)
   }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches{
            let pointOfTouch = touch.locationInNode(self)
            let nodeITapped = nodeAtPoint(pointOfTouch)
            
            if nodeITapped.name == "leftButton"{
                leftb.alpha = 0.5
                let fadeInAction = SKAction.fadeOutWithDuration(1)
                leftb.runAction(fadeInAction)
                let sceneToMoveTo = MainScene (size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fadeWithDuration(2)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
    
            }
            
        }
    }
}
