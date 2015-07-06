//
//  GameScene.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/2/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
    // node can be anything
    // image, text, video, shape, emitter, crop, effect
    CGPoint greenNodePoint = CGPointMake(self.size.width / 2, self.size.height/2);
    // not sure why the other CGPointMake from the tutorial failed, glad to have found a solution
    SKSpriteNode *greenNode = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:CGSizeMake(100, 100)];
    greenNode.position = greenNodePoint;
    greenNode.anchorPoint = CGPointMake(0, 0);  // bottom-left
    [self addChild:greenNode];
    
    SKSpriteNode *redNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(50, 50)];
    redNode.position = greenNodePoint;
    redNode.anchorPoint = CGPointMake(0, 0);    // bottom-left
    [self addChild:redNode];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
