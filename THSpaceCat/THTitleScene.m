//
//  THTitleScene.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/8/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THTitleScene.h"
#import "THGamePlayScene.h"

@implementation THTitleScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"splash_1"];
    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:background];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    THGamePlayScene *gamePlayScene = [THGamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:gamePlayScene transition:transition];
}

@end
