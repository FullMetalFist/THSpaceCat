//
//  THSpaceDogNode.h
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/13/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSUInteger, THSpaceDogType) {
    THSpaceDogTypeA = 0,
    THSpaceDogTypeB = 1
};

@interface THSpaceDogNode : SKSpriteNode

+ (instancetype) spaceDogOfType:(THSpaceDogType)type;

@end
