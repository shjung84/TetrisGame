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
	static var dy = 2
	static let gab = 1
	static var startPoint = CGPoint()
}
