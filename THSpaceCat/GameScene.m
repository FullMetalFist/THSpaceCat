//
//  GameScene.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/2/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

//-(instancetype)initWithSize:(CGSize)size {
//    if (self = [super initWithSize:size]) {
//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
//        // node can be anything
//        // image, text, video, shape, emitter, crop, effect
//        CGSize greenNodeSize = CGSizeMake(100, 100);
//        SKSpriteNode *greenNode = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:greenNodeSize];
//        [self addChild:greenNode];
//    }
//    return self;
//}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
    // node can be anything
    // image, text, video, shape, emitter, crop, effect
    CGSize greenNodeSize = CGSizeMake(100, 100);
    SKSpriteNode *greenNode = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:greenNodeSize];
    greenNode.position = CGPointMake(150, 150);
    [self addChild:greenNode];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
