//
//  GameScene.swift
//  Bait
//
//  Created by Victor  Omiwole on 2016-07-20.
//  Copyright (c) 2016 test 1. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
      let player = SKSpriteNode(imageNamed: "bfish final")
      let tapToStartLabel = SKLabelNode(fontNamed: "The Bold Font")
    
            enum gameState{
            case preGame
            case inGame
            case afterGame
        }
    
       var currentGameState = gameState.preGame
    
         struct PhysicsCategories{
            static let None : UInt32 = 0
            static let Player : UInt32 = 0b1 //1
            static let Enemy: UInt32 = 0b100 //4
        
        }
        func random() -> CGFloat {
            return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        }
        
        func random(min min: CGFloat, max: CGFloat) -> CGFloat {
            return random() * (max - min) + min
        }
       
    var gameArea: CGRect
    
    override init(size: CGSize){
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth)/2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        override func didMoveToView(view: SKView) {
            
            let spawn = SKAction.runBlock(particle)
            let waitToSpawn = SKAction.waitForDuration(20)
            let spawnSequence = SKAction.sequence([spawn, waitToSpawn])
            let spawnForever = SKAction.repeatActionForever(spawnSequence)
            self.runAction(spawnForever, withKey: "spawningEnemies")
            
            player.setScale(0.1)
            player.position = CGPoint(x: self.size.width/2, y: 0 - player.size.height)
            player.zPosition = 2
            player.physicsBody = SKPhysicsBody(rectangleOfSize: player.size)
            player.physicsBody!.affectedByGravity = false
            player.physicsBody!.categoryBitMask = PhysicsCategories.Player
            self.addChild(player)
            
            tapToStartLabel.text = "Tap To Begin"
            tapToStartLabel.fontName = "TimeBurner"
            tapToStartLabel.fontSize = 100
            tapToStartLabel.fontColor = SKColor.whiteColor()
            tapToStartLabel.zPosition = 1
            tapToStartLabel.position = CGPoint(x: self.size.width/2, y:self.size.height/2)
            tapToStartLabel.alpha = 0
            //completely see through at alpha level 0
            self.addChild(tapToStartLabel)
            self.physicsWorld.contactDelegate = self
            let fadeInAction = SKAction.fadeInWithDuration(0.3)
            tapToStartLabel.runAction(fadeInAction)
                
            var bg1 = SKSpriteNode()
            
            for i in 0...1{
                //run up to when i is 1 (run twice for 0 and 1
                if CGFloat(i) == 0{
                bg1 = SKSpriteNode(imageNamed: "bground2")
                    self.addChild(bg1)
                    
                    bg1.size = self.size
                    bg1.anchorPoint = CGPoint(x: 0.5, y: 0)
                    bg1.position = CGPoint(x: self.size.width/2,
                                           y: self.size.height*CGFloat(i))
                    bg1.name = "Background"
                    bg1.zPosition = 0
                    
                }else{
                    
                bg1 = SKSpriteNode(imageNamed: "bg2invert")
                self.addChild(bg1)
                    
                    bg1.size = self.size
                    bg1.anchorPoint = CGPoint(x: 0.5, y: 0)
                    bg1.position = CGPoint(x: self.size.width/2,
                                           y: self.size.height*CGFloat(i))
                    bg1.name = "Background"
                    bg1.zPosition = 0
                    
                }
               
            
        }
            
            
            
     }
    
    func startGame(){
        
        currentGameState = gameState.inGame
        
        let fadeOutAction = SKAction.fadeOutWithDuration(0.5)
        let deleteAction = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([fadeOutAction, deleteAction])
        tapToStartLabel.runAction(deleteSequence)
        //first screen that is seen, touch touch to begin fades
        
        let moveFish = SKAction.moveToY(self.size.height*0.5, duration: 0.5)
        let startGameSequence = SKAction.sequence([moveFish])
        player.runAction(startGameSequence)
        //playership flies in and game begins
        
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
    
    
    
    var lastUpdateTime: NSTimeInterval = 0
    var deltaFrameTime: NSTimeInterval = 0
    var amountToMovePerSecond: CGFloat = 100
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.locationInNode(self)
            let previousPointOfTouch = touch.previousLocationInNode(self)
            
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            
            if currentGameState == gameState.inGame {
                player.position.x += amountDragged
                
            }
            if player.position.x > CGRectGetMaxX(gameArea) - player.size.width/2{
                player.position.x = CGRectGetMaxX(gameArea) - player.size.width/2
            }
            
            if player.position.x < CGRectGetMinX(gameArea) + player.size.width/2{
                player.position.x = CGRectGetMinX(gameArea) + player.size.width/2
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if currentGameState == gameState.preGame{
            startGame()
        }
        
    }
    
    
    override func update(currentTime: NSTimeInterval){
        
        if  lastUpdateTime == 0{
            lastUpdateTime = currentTime
        }
            
        else{
            
            deltaFrameTime = currentTime - lastUpdateTime
            lastUpdateTime = currentTime
        }
        
        let amountToMoveBackground = amountToMovePerSecond * CGFloat(deltaFrameTime)
        
        self.enumerateChildNodesWithName("Background"){
            //enumerate with label named "Background")
            bg1, stop in
            
            if self.currentGameState == gameState.inGame{
                bg1.position.y -= amountToMoveBackground
            }
            
            if bg1.position.y < -self.size.height{
                bg1.position.y += self.size.height*2
            }
            
            
        }
    
    }
    
   }

    

