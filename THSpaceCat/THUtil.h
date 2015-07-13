//
//  THUtil.h
//  THSpaceCat
//
//  Created by Michael Vilabrera on 7/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int THProjectileSpeed = 400;

typedef NS_OPTIONS(uint32_t, THCollisionCategory) {
    THCollisionCategoryEnemy        = 1 << 0,       // 0001
    THCollisionCategoryProjectile   = 1 << 1,       // 0010
    THCollisionCategoryDebris       = 1 << 2,       // 0100
    THCollisionCategoryGround       = 1 << 3        // 1000
};

@interface THUtil : NSObject

@end
