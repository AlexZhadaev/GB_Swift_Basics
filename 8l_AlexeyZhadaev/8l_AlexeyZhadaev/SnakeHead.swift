//
//  SnakeHead.swift
//  8l_AlexeyZhadaev
//
//  Created by Жадаев Алексей on 24.07.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit
class SnakeHead: SnakeBodyPart {
  
    override init(atPoint point: CGPoint){
        super.init(atPoint:point)
        
        // категория - голова
        self.physicsBody?.categoryBitMask = CollisionCategories.SnakeHead
        // пересекается с телом, яблоком и границей экрана
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple | CollisionCategories.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
