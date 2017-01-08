//
//  MOModuleItem.h
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, MOModuleItemType) {
    
    MOModuleItemTypeFallbackException,
    MOModuleItemTypeWishlist,
    MOModuleItemTypeDesigners,
    MOModuleItemTypeRecommendations,
};

@interface MOModuleItem : NSObject

@property (nonatomic, assign, readonly) MOModuleItemType type;

- (nonnull instancetype)initWithType:(MOModuleItemType)type;

@end
