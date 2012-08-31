//
//  DiaryStore.h
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entry;
@class Friend;

@interface DiaryStore : NSObject

+(NSArray *)allEntries;

+(Entry *)makeNewEntryWithText:(NSString *)text AndWithImage:(UIImage *)image;

+(void)save;

+(NSArray *)getAllFriends;
+(Friend *)addFriendWithName:(NSString *)name;

@end
