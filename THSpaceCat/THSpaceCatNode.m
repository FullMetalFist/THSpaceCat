//
//  THSpaceCatNode.m
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "THSpaceCatNode.h"

@interface THSpaceCatNode()

@property (nonatomic) SKAction *tapAction;

@end

@implementation THSpaceCatNode

+ (instancetype)spaceCatAtPosition:(CGPoint)position {
    THSpaceCatNode *spaceCat = [self spriteNodeWithImageNamed:@"spacecat_1"];
    spaceCat.position = position;
    spaceCat.anchorPoint = CGPointMake(0.5, 0);
    spaceCat.name = @"SpaceCat";
    
    return spaceCat;
}

- (void)performTap {
    [self runAction:self.tapAction];
}

- (SKAction *)tapAction {
    if (_tapAction) {
        return _tapAction;
    }
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"spaceCat_2"], [SKTexture textureWithImageNamed:@"spaceCat_1"]];
    
    _tapAction = [SKAction animateWithTextures:textures timePerFrame:0.25];
    
    return _tapAction;
}

@end
