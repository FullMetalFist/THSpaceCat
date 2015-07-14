//
//  THTitleScene.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/8/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THTitleScene.h"
#import "THGamePlayScene.h"
#import <AVFoundation/AVFoundation.h>

@interface THTitleScene()

@property (nonatomic) SKAction *pressStartSFX;
@property (nonatomic) AVAudioPlayer *backgroundMusic;

@end

@implementation THTitleScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"splash_1"];
    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:background];
    self.pressStartSFX = [SKAction playSoundFileNamed:@"PressStart.caf" waitForCompletion:NO];
    NSURL *musicURL = [[NSBundle mainBundle] URLForResource:@"StartScreen" withExtension:@"mp3"];
    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    self.backgroundMusic.numberOfLoops = -1;    // -1 is infinite
    [self.backgroundMusic prepareToPlay];
    [self.backgroundMusic play];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self runAction:self.pressStartSFX];
    [self.backgroundMusic stop];
    THGamePlayScene *gamePlayScene = [THGamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:gamePlayScene transition:transition];
}

@end
