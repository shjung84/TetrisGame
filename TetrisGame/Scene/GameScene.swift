//
//  GameScene.swift
//  TetrisGame
//
//  Created by SH.Jung on 2022/09/26.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	var leftButton : LeftButton?
	var rightButton : RightButton?
	var rotationButton : RotationButton?
	var downButton : DownButton?
	var stopButton : StopButton?
	var sounds : Sounds?
	var updateTime = 0.0
	override func didMove(to view: SKView) {
		setting()
	}
	
	func setting() {
		Variables.scene = self
		_ = BackGround()
		NextBricks().addBrick()
		_ = BrickGenerator()
				
		leftButton = LeftButton()
		rightButton = RightButton()
		rotationButton = RotationButton()
		downButton = DownButton()
		stopButton = StopButton()
		sounds = Sounds()
		lightEffect()
	}
	
	func lightEffect() {
		let light = SKLightNode()
		light.position = CGPoint(x: Int(view!.frame.width) / 2, y: -100)
		light.ambientColor = .white
		light.lightColor = .white
		light.categoryBitMask = 0b0001
		addChild(light)
	}
	
	func checkBrick() {
		let arrays = Variables.backarrays
		for item in arrays {
			print(item)
		}
	}
	
	override func update(_ currentTime: TimeInterval) {
		if updateTime == 0 {
			updateTime = currentTime
		}
		
		// λΈλ­ μλ
		if currentTime - updateTime > 1 {
			updateTime = currentTime
			if !Variables.isPause {
				downButton?.brickDown()
			}
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first
		let location = touch?.location(in: self)
		let node = nodes(at: location!)
		for item in node {
			if item.name == "left" {
				leftButton?.brickMoveLeft()
				sounds?.buttonSounds(buttonName: "move")
			}
			if item.name == "right" {
				rightButton?.brickMoveRight()
				sounds?.buttonSounds(buttonName: "move")
			}
			if item.name == "rotation" {
				rotationButton?.brickRotation()
				sounds?.buttonSounds(buttonName: "rotation")
			}
			if item.name == "down" {
				while (downButton?.isbrickDownable())! {
					downButton?.brickDown()
				}
				sounds?.buttonSounds(buttonName: "down")
				downButton?.anim()
			}
			if item.name == "stop" {
				stopButton?.brickStop()
				if !Variables.isPause {
					sounds?.soundPlay()
				} else {
					sounds?.soundStop()
				}
			}
		}
		
	}
	
}
