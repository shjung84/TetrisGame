//
//  LeftButton.swift
//  TetrisGame
//
//  Created by SH.Jung on 2022/10/03.
//

import Foundation
import SpriteKit

class LeftButton {
	
	init() {
		let btn = SKSpriteNode()
		btn.texture = SKTexture(imageNamed: "left_btn1")
		btn.size = CGSize(width: 50, height: 50)
		btn.name = "left"
		btn.position = CGPoint(x: 50, y: -Int(Variables.scene.frame.height) + 50)
		Variables.scene.addChild(btn)
	}
	
	func brickMoveLeft() {
		print("Left Button")
	}
	
	
}
