//
//  THGamePlayScene.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THGamePlayScene.h"

@implementation THGamePlayScene

- (void)didMoveToView:(SKView *)view {
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:background];
    
    SKSpriteNode *machine = [SKSpriteNode spriteNodeWithImageNamed:@"machine_1"];
    machine.position  = CGPointMake(CGRectGetMidX(self.frame), 25);
    machine.anchorPoint = CGPointMake(0.5, 0);
    [self addChild:machine];
}

- (void) update:(NSTimeInterval)currentTime {
    NSLog(@"%f", fmod(currentTime, 60));
}

@end
