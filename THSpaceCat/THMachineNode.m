//
//  THMachineNode.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THMachineNode.h"

@implementation THMachineNode

+ (instancetype) machineAtPosition:(CGPoint)position {
    THMachineNode *machine = [self spriteNodeWithImageNamed:@"machine_1"];
    machine.position  = position;
    machine.zPosition = 8;
    machine.name = @"Machine";
    machine.anchorPoint = CGPointMake(0.5, 0);
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine_1"],[SKTexture textureWithImageNamed:@"machine_2"]];
    
    SKAction *machineAnimation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    
    SKAction *machineRepeat = [SKAction repeatActionForever:machineAnimation];
    
    [machine runAction:machineRepeat];
    
    return machine;
}

@end
