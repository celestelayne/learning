//
//  Friend.h
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *manyEntries;
@end

@interface Friend (CoreDataGeneratedAccessors)

- (void)addManyEntriesObject:(NSManagedObject *)value;
- (void)removeManyEntriesObject:(NSManagedObject *)value;
- (void)addManyEntries:(NSSet *)values;
- (void)removeManyEntries:(NSSet *)values;

@end
