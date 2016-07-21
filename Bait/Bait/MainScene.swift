//
//  MainScene.swift
//  Bait
//
//  Created by Victor  Omiwole on 2016-07-20.
//  Copyright © 2016 test 1. All rights reserved.
//

import Foundation
import SpriteKit

class MainScene: SKScene{
    
        let gameName1 = SKLabelNode()
        let playb = SKSpriteNode(imageNamed: "playbutton")
    
    override func didMoveToView(view: SKView) {
        
        let spawn = SKAction.runBlock(particle)
        let waitToSpawn = SKAction.waitForDuration(20)
        let spawnSequence = SKAction.sequence([spawn, waitToSpawn])
        let spawnForever = SKAction.repeatActionForever(spawnSequence)
        self.runAction(spawnForever, withKey: "spawningEnemies")
        //spawns particles in title screen in a loop
        
        
        
        gameName1.text = " Bait "
        gameName1.fontName = "TimeBurner"
        gameName1.fontSize = 220
        gameName1.fontColor = SKColor.whiteColor()
        gameName1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        gameName1.zPosition = 12
        self.addChild(gameName1)
        
        
        let grow1 = SKAction.scaleTo(1.1, duration: 1.5)
        let shrink1 = SKAction.scaleTo(1.0, duration: 1.5)
        let gSequence1 = SKAction.sequence([grow1,shrink1])
        let bigsmallForever1 = SKAction.repeatActionForever(gSequence1)
        gameName1.runAction(bigsmallForever1, withKey: "spawningsSizes")
        
        let appear1 = SKAction.runBlock(fishappear1)
        let appear2 = SKAction.runBlock(fishappear2)
        let appear3 = SKAction.runBlock(fishappear3)
        let waitToAppear = SKAction.waitForDuration(1)
        let order = SKAction.sequence([appear3, waitToAppear, appear2, waitToAppear, appear1, waitToAppear] )
        let appearenceForever = SKAction.repeatActionForever(order)
        self.runAction(appearenceForever, withKey: "spawningsSizes")
        
        
        
        let background = SKSpriteNode(imageNamed: "gradientScreen1")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        background.setScale(1.5)
        self.addChild(background)
       
  
    
        
        playb.position = CGPoint(x: self.size.width/2, y: self.size.height*0.4)
        playb.zPosition = 2
        playb.name = "playbutton"
        playb.setScale(0.4)
        self.addChild(playb)
        
        let homeb = SKSpriteNode(imageNamed: "homebutton")
        homeb.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.35)
        homeb.zPosition = 2
        homeb.setScale(0.3)
        self.addChild(homeb)
        
        
        let trophyb = SKSpriteNode(imageNamed: "trophybutton")
        trophyb.position = CGPoint(x: self.size.width*0.4, y: self.size.height*0.35)
        trophyb.zPosition = 2
        trophyb.setScale(0.3)
        self.addChild(trophyb)
        
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
    
    
    func fishappear1(){
        
         let bfish1 = SKSpriteNode(imageNamed: "bfish final")
        bfish1.position = CGPoint(x: self.size.width*0.7, y: self.size.height*0.52)
        bfish1.zPosition = 3
        bfish1.setScale(0.5)
        bfish1.alpha = 0
        let fade = SKAction.fadeInWithDuration(1)
        let fishsequence = SKAction.sequence([fade, ])
        self.addChild(bfish1)
        bfish1.runAction(fishsequence)
        
        }
    
    func fishappear2(){
        let bfish2 = SKSpriteNode(imageNamed: "bfish final")
        bfish2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.52)
        bfish2.zPosition = 3
        let fade = SKAction.fadeInWithDuration(1)
        bfish2.alpha = 0
        bfish2.setScale(0.35)
        let fishsequence = SKAction.sequence([fade, ])
        self.addChild(bfish2)
        bfish2.runAction(fishsequence)
        
        }
        
    
    func fishappear3(){
        let bfish3 = SKSpriteNode(imageNamed: "bfish final")
        bfish3.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.52)
        bfish3.zPosition = 3
        bfish3.setScale(0.1)
        bfish3.alpha = 0
        let fade = SKAction.fadeInWithDuration(1)
        let fishsequence = SKAction.sequence([fade, ])
        self.addChild(bfish3)
        bfish3.runAction(fishsequence)
    
        }
  
        
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            
            for touch: AnyObject in touches{
                let pointOfTouch = touch.locationInNode(self)
                let nodeITapped = nodeAtPoint(pointOfTouch)
                
                if nodeITapped.name == "playbutton"{
                    
                    playb.alpha = 0.5
                    
                    let fadeInAction = SKAction.fadeOutWithDuration(1)
                    playb.runAction(fadeInAction)
                    
                    
                    let sceneToMoveTo = GameScene (size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    
                    let myTransition = SKTransition.fadeWithDuration(2)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
    
                 
        
     }
   }
 }
}
