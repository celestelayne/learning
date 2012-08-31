//
//  Entry.h
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend;

@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSData * photoData;
@property (nonatomic, retain) NSSet *manyFriends;
@end

@interface Entry (CoreDataGeneratedAccessors)

- (void)addManyFriendsObject:(Friend *)value;
- (void)removeManyFriendsObject:(Friend *)value;
- (void)addManyFriends:(NSSet *)values;
- (void)removeManyFriends:(NSSet *)values;

@end
