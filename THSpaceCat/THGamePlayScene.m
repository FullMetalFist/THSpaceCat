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
#import "THUtil.h"
#import "THHudNode.h"
#import "THGameOverNode.h"
#import <AVFoundation/AVFoundation.h>

@interface THGamePlayScene()

@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) NSTimeInterval timeSinceEnemyAdded;
@property (nonatomic) NSTimeInterval totalGameTime;
@property (nonatomic) NSInteger minSpeed;
@property (nonatomic) NSTimeInterval addEnemyTimeInterval;

@property (nonatomic) SKAction *damageSFX;
@property (nonatomic) SKAction *explodeSFX;
@property (nonatomic) SKAction *laserSFX;

@property (nonatomic) AVAudioPlayer *backgroundMusic;
@property (nonatomic) AVAudioPlayer *gameOverMusic;

@property (nonatomic) BOOL gameOver;
@property (nonatomic) BOOL restart;
@property (nonatomic) BOOL gameOverDisplayed;

@end

@implementation THGamePlayScene

- (void)didMoveToView:(SKView *)view {
    self.lastUpdateTimeInterval = 0;
    self.timeSinceEnemyAdded = 0;
    self.totalGameTime = 0;
    self.minSpeed = THSpaceDogMinSpeed;
    self.addEnemyTimeInterval = 1.5;
    self.restart = NO;
    self.gameOver = NO;
    self.gameOverDisplayed = NO;
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:background];
    
    THMachineNode *machine = [THMachineNode machineAtPosition:CGPointMake(CGRectGetMidX(self.frame), 40)];
    [self addChild:machine]; //CGPointMake(CGRectGetMidX(self.frame), 40)
    
    THSpaceCatNode *spaceCat = [THSpaceCatNode spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y - 2)];
    [self addChild:spaceCat];
    
    self.physicsWorld.gravity = CGVectorMake(0, -9.8);
    self.physicsWorld.contactDelegate = self;
    
    THGroundNode *ground = [THGroundNode groundWithSize:CGSizeMake(self.frame.size.width, 40)];
    [self addChild:ground];
    [self setupSounds];
    
    THHudNode *hud = [THHudNode hudAtPosition:CGPointMake(0, self.frame.size.height - 20) inFrame:self.frame];
    [self addChild:hud];
    
    [self.backgroundMusic play];
}

- (void) update:(NSTimeInterval)currentTime {
    
    if (self.lastUpdateTimeInterval) {
        self.timeSinceEnemyAdded += currentTime - self.lastUpdateTimeInterval;
        self.totalGameTime += currentTime - self.lastUpdateTimeInterval;
    }
    
    if (self.timeSinceEnemyAdded > self.addEnemyTimeInterval && !self.gameOver) {
        [self addSpaceDog];
        self.timeSinceEnemyAdded = 0;
    }
    
    self.lastUpdateTimeInterval = currentTime;
    
    if (self.totalGameTime > 480) {
        // 480 seconds = 8 minutes
        self.addEnemyTimeInterval = 0.5;
        self.minSpeed = -160;
    } else if (self.totalGameTime > 240) {
        self.addEnemyTimeInterval = 0.65;
        self.minSpeed = -150;
    } else if (self.totalGameTime > 120) {
        self.addEnemyTimeInterval = 0.75;
        self.minSpeed = -125;
    } else if (self.totalGameTime > 30) {
        self.addEnemyTimeInterval = 1.0;
        self.minSpeed = -100;
    }
    
    if (self.gameOver && !self.gameOverDisplayed) {
        [self performGameOver];
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (!self.gameOver) {
        for (UITouch *touch in touches) {
            CGPoint position = [touch locationInNode:self];
            [self shootProjectileTowardsPosition:position];
        }
    } else if (self.restart) {
        for (SKNode *node in [self children]) {
            [node removeFromParent];    // safety measure to create a clean screen
        }
        THGamePlayScene *scene = [THGamePlayScene sceneWithSize:self.view.bounds.size];
        [self.view presentScene:scene];
    }
    
    
}

- (void) performGameOver {
    THGameOverNode *gameOver = [THGameOverNode gameOverAtPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
    [self addChild:gameOver];
    self.restart = YES;
    self.gameOverDisplayed = YES;
    [gameOver performAnimation];
    [self.backgroundMusic stop];
    [self.gameOverMusic play];
}

- (void) setupSounds {
    NSURL *musicURL = [[NSBundle mainBundle] URLForResource:@"Gameplay" withExtension:@"mp3"];
    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    self.backgroundMusic.numberOfLoops = -1;    // -1 is infinite
    [self.backgroundMusic prepareToPlay];
    
    NSURL *gameOverURL = [[NSBundle mainBundle] URLForResource:@"GameOver" withExtension:@"mp3"];
    self.gameOverMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:gameOverURL error:nil];
    self.gameOverMusic.numberOfLoops = 1;
    [self.gameOverMusic prepareToPlay];
    
    self.damageSFX = [SKAction playSoundFileNamed:@"Damage.caf" waitForCompletion:NO];
    self.explodeSFX = [SKAction playSoundFileNamed:@"Explode.caf" waitForCompletion:NO];
    self.laserSFX = [SKAction playSoundFileNamed:@"Laser.caf" waitForCompletion:NO];
}

- (void)shootProjectileTowardsPosition:(CGPoint)position {
    THSpaceCatNode *spaceCat = (THSpaceCatNode *)[self childNodeWithName:@"SpaceCat"];
    [spaceCat performTap];
    
    THMachineNode *machine = (THMachineNode *)[self childNodeWithName:@"Machine"];
    
    THProjectileNode *projectile = [THProjectileNode projectileAtPosition:CGPointMake(machine.position.x, machine.position.y + machine.frame.size.height - 15)];
    
    [self addChild:projectile];
    [projectile moveTowardsPosition:position];
    [self runAction:self.laserSFX];
}

- (void)addSpaceDog {
    NSUInteger randomSpaceDog = [THUtil randomWithMin:0 max:2];
    
    THSpaceDogNode *spaceDog = [THSpaceDogNode spaceDogOfType:randomSpaceDog];
    float dy = [THUtil randomWithMin:THSpaceDogMinSpeed max:THSpaceDogMaxSpeed];
    spaceDog.physicsBody.velocity = CGVectorMake(0, dy);
    float y = self.frame.size.height + spaceDog.size.height;
    float x = [THUtil randomWithMin:10 + spaceDog.size.width max:self.frame.size.width - spaceDog.size.width - 10];
    
    spaceDog.position = CGPointMake(x, y);
    [self addChild:spaceDog];
}

- (void) didBeginContact:(SKPhysicsContact *)contact {
    SKPhysicsBody *firstBody, *secondBody;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if (firstBody.categoryBitMask == THCollisionCategoryEnemy && secondBody.categoryBitMask == THCollisionCategoryProjectile) {
        NSLog(@"BLAM!");
        THSpaceDogNode *spaceDog = (THSpaceDogNode *)firstBody.node;
        THProjectileNode *projectileNode = (THProjectileNode *)secondBody.node;
        
        if ([spaceDog isDamaged]) {
            [self addPoints:THPointsPerHit];
            [self runAction:self.explodeSFX];
            [spaceDog removeFromParent];
            [projectileNode removeFromParent];
            [self createDebrisAtPosition:contact.contactPoint];
        }
        
        
    } else if (firstBody.categoryBitMask == THCollisionCategoryEnemy && secondBody.categoryBitMask == THCollisionCategoryGround) {
        NSLog(@"Hit ground!");
        THSpaceDogNode *spaceDog = (THSpaceDogNode *)firstBody.node;
        [self runAction:self.damageSFX];
        [spaceDog removeFromParent];
        [self createDebrisAtPosition:contact.contactPoint];
        [self loseLife];
    }
}

- (void) addPoints:(NSInteger)points {
    THHudNode *hud = (THHudNode *)[self childNodeWithName:@"hud"];
    [hud addPoints:points];
}

- (void) loseLife {
    THHudNode *hud = (THHudNode *)[self childNodeWithName:@"hud"];
    self.gameOver = [hud loseLife];
}

- (void) createDebrisAtPosition:(CGPoint)position {
    NSInteger numberOfPieces = [THUtil randomWithMin:5 max:20];
    
    for (int i = 0; i < numberOfPieces; i++) {
        NSInteger randomPiece = [THUtil randomWithMin:1 max:4];
        NSString *imageName = [NSString stringWithFormat:@"debri_%ld", (long)randomPiece];
        
        SKSpriteNode *debris = [SKSpriteNode spriteNodeWithImageNamed:imageName];
        debris.position = position;
        [self addChild:debris];
        
        debris.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:debris.frame.size];
        debris.physicsBody.categoryBitMask = THCollisionCategoryDebris;
        debris.physicsBody.contactTestBitMask = 0;
        debris.physicsBody.collisionBitMask = THCollisionCategoryGround | THCollisionCategoryDebris;
        
        debris.name = @"Debris";
        debris.physicsBody.velocity = CGVectorMake([THUtil randomWithMin:-150 max:150], [THUtil randomWithMin:150 max:350]);
        [debris runAction:[SKAction waitForDuration:2.0] completion:^{
            [debris removeFromParent];
        }];
    }
    
    NSString *explosionPath = [[NSBundle mainBundle] pathForResource:@"Explosion" ofType:@"sks"];
    SKEmitterNode *explosion = [NSKeyedUnarchiver unarchiveObjectWithFile:explosionPath];
    explosion.position = position;
    [self addChild:explosion];
    
    [explosion runAction:[SKAction waitForDuration:2.0] completion:^{
        [explosion removeFromParent];
    }];
}

@end
