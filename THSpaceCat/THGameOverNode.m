//
//  THGameOverNode.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/15/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THGameOverNode.h"

@implementation THGameOverNode

+ (instancetype)gameOverAtPosition:(CGPoint)position {
    THGameOverNode *gameOver = [self node];
    
    SKLabelNode *gameOverLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    gameOverLabel.name = @"GameOver";
    gameOverLabel.text = @"Game Over";
    gameOverLabel.fontSize = 48;
    gameOverLabel.position = position;
    [gameOver addChild:gameOverLabel];
    
    return gameOver;
}

@end
