//
//  THGamePlayScene.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THGamePlayScene.h"
#import "THMachineNode.h"
#import "THSpaceCatNode.h"
#import "THProjectileNode.h"
#import "THSpaceDogNode.h"
#import "THGroundNode.h"

@implementation THGamePlayScene

- (void)didMoveToView:(SKView *)view {
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:background];
    
    THMachineNode *machine = [THMachineNode machineAtPosition:CGPointMake(CGRectGetMidX(self.frame), 40)];
    [self addChild:machine]; //CGPointMake(CGRectGetMidX(self.frame), 40)
    
    THSpaceCatNode *spaceCat = [THSpaceCatNode spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y - 2)];
    [self addChild:spaceCat];
    [self addSpaceDog];
    
    self.physicsWorld.gravity = CGVectorMake(0, -9.8);
    THGroundNode *ground = [THGroundNode groundWithSize:CGSizeMake(self.frame.size.width, 22)];
    [self addChild:ground];
}

- (void) update:(NSTimeInterval)currentTime {
    NSLog(@"%f", fmod(currentTime, 60));
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint position = [touch locationInNode:self];
        [self shootProjectileTowardsPosition:position];
    }
}

- (void)shootProjectileTowardsPosition:(CGPoint)position {
    THSpaceCatNode *spaceCat = (THSpaceCatNode *)[self childNodeWithName:@"SpaceCat"];
    [spaceCat performTap];
    
    THMachineNode *machine = (THMachineNode *)[self childNodeWithName:@"Machine"];
    
    THProjectileNode *projectile = [THProjectileNode projectileAtPosition:CGPointMake(machine.position.x, machine.position.y + machine.frame.size.height - 15)];
    
    [self addChild:projectile];
    [projectile moveTowardsPosition:position];
}

- (void)addSpaceDog {
    THSpaceDogNode *spaceDogA = [THSpaceDogNode spaceDogOfType:THSpaceDogTypeA];
    spaceDogA.position = CGPointMake(100, 300);
    [self addChild:spaceDogA];
    
    THSpaceDogNode *spaceDogB = [THSpaceDogNode spaceDogOfType:THSpaceDogTypeB];
    spaceDogB.position = CGPointMake(200, 300);
    [self addChild:spaceDogB];
}

@end
