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
}

@end
