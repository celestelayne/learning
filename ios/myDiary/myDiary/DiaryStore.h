//
//  DiaryStore.h
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entry;


@interface DiaryStore : NSObject

+(NSArray *)allEntries;

+(Entry *)makeNewEntryWithText:(NSString *)text;

+(void)save;

@end
