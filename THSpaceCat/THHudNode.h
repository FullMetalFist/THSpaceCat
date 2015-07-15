//
//  THHudNode.h
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/15/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface THHudNode : SKNode

@property (nonatomic) NSInteger lives;
@property (nonatomic) NSInteger score;

+ (instancetype)hudAtPosition:(CGPoint)position inFrame:(CGRect)frame;
- (void)addPoints:(NSInteger)points;
- (BOOL)loseLife;

@end
