//
//  THGameOverNode.h
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/15/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface THGameOverNode : SKNode

+ (instancetype)gameOverAtPosition:(CGPoint)position;
- (void) performAnimation;

@end
