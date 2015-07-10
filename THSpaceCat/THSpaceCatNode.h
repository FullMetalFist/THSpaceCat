//
//  THSpaceCatNode.h
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface THSpaceCatNode : SKSpriteNode

+ (instancetype)spaceCatAtPosition:(CGPoint)position;
- (void)performTap;

@end
