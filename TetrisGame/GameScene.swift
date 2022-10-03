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
	override func didMove(to view: SKView) {
		
		Variables.scene = self
		_ = BackGround()
		_ = BrickGenerator()
		
		leftButton = LeftButton()
		rightButton = RightButton()
		rotationButton = RotationButton()
		
		checkBrick()
	}
	
	func checkBrick() {
		let arrays = Variables.backarrays
		for item in arrays {
			print(item)
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first
		let location = touch?.location(in: self)
		let node = nodes(at: location!)
		for item in node {
			if item.name == "left" {
				leftButton?.brickMoveLeft()
			}
			if item.name == "right" {
				rightButton?.brickMoveRight()
			}
			if item.name == "rotation" {
				rotationButton?.brickRotation()
			}
		}
		
	}
	
}
