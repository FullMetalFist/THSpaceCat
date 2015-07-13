//
//  THGroundNode.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/13/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THGroundNode.h"
#import "THUtil.h"

@implementation THGroundNode

+ (instancetype)groundWithSize:(CGSize)size {
    THGroundNode *ground = [self spriteNodeWithColor:[SKColor greenColor] size:size];
    ground.name = @"Ground";
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    ground.position = CGPointMake(size.width/2, size.height/2);
    
    [ground setupPhysicsBody];
    
    return ground;
}

- (void)setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    self.physicsBody.categoryBitMask = THCollisionCategoryGround;
    self.physicsBody.collisionBitMask = THCollisionCategoryDebris;
    self.physicsBody.contactTestBitMask = THCollisionCategoryEnemy;
}

@end
