//
//  THSpaceDogNode.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/13/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THSpaceDogNode.h"
#import "THUtil.h"

@implementation THSpaceDogNode

+ (instancetype) spaceDogOfType:(THSpaceDogType)type {
    THSpaceDogNode *spaceDog;
    
    NSArray *textures;
    
    if (type == THSpaceDogTypeA) {
        spaceDog = [self spriteNodeWithImageNamed:@"spacedog_A_1"];
        textures = @[[SKTexture textureWithImageNamed:@"spacedog_A_1"], [SKTexture textureWithImageNamed:@"spacedog_A_2"], [SKTexture textureWithImageNamed:@"spacedog_A_3"]];
    }
    else {
        spaceDog = [self spriteNodeWithImageNamed:@"spacedog_B_1"];
        textures = @[[SKTexture textureWithImageNamed:@"spacedog_B_1"], [SKTexture textureWithImageNamed:@"spacedog_B_2"], [SKTexture textureWithImageNamed:@"spacedog_B_3"], [SKTexture textureWithImageNamed:@"spacedog_B_4"]];
    }
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    [spaceDog runAction:[SKAction repeatActionForever:animation]];
    
    [spaceDog setupPhysicsBody];
    
    return spaceDog;
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.velocity = CGVectorMake(0, -50);
    
    self.physicsBody.categoryBitMask = THCollisionCategoryEnemy;
    self.physicsBody.collisionBitMask = 0;      // not colliding the enemy with anything
    self.physicsBody.contactTestBitMask = THCollisionCategoryProjectile | THCollisionCategoryGround;    // 0010 | 1000 = 1010
}

@end
