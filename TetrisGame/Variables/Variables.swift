//
//  Variables.swift
//  TetrisGame
//
//  Created by SH.Jung on 2022/09/26.
//

import Foundation
import SpriteKit

struct Variables {
	static var backarrays = [[Int]]()
	static var scene = SKScene()
	static var brickValue = Brick().bricks()
	static var dx = 4
	static var dy = 3
	static let gab = 1
	static var startPoint = CGPoint()
	static var brickArrays = Array<CGPoint>()
	static var brickNode = Array<SKSpriteNode>()
}
