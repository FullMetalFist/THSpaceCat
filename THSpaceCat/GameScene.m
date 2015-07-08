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
    CGPoint greenNodePoint = CGPointMake(20, 110);   // landscape (viewDidLayoutSubviews)
    
    // since the skscene keeps screwing around, I need to experiment with this.
//    CGPoint greenNodePoint = CGPointMake(20, 120);    // this is necessary for landscape (viewDidLoad)
//    CGPoint greenNodePoint = CGPointMake(320, 20);    // this is necessary for portrait (viewDidLoad)
    // not sure why the other CGPointMake from the tutorial failed, glad to have found a solution
    SKSpriteNode *greenNode = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:CGSizeMake(15, 150)];
    greenNode.position = greenNodePoint;
    greenNode.anchorPoint = CGPointMake(0, 0);  // bottom-left
    [self addChild:greenNode];
    
    SKSpriteNode *redNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(150, 15)];
    redNode.position = greenNodePoint;
    redNode.anchorPoint = CGPointMake(0, 0);    // bottom-left
    [self addChild:redNode];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
