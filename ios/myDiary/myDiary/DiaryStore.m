//
//  DiaryStore.m
//  myDiary
//
//  Created by hugo on 8/30/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "DiaryStore.h"
#import "Entry.h"
#import "Friend.h"

NSManagedObjectContext *diaryContext;
NSManagedObjectModel *diaryModel;

@interface DiaryStore()

+(NSManagedObjectContext *)context;
+(NSManagedObjectModel *)model;

@end

@implementation DiaryStore
+(NSManagedObjectModel *)model {
    if (!diaryModel) {
        diaryModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    }
    
    return diaryModel;
}


+(NSManagedObjectContext *)context {
    if (!diaryContext) {
        //Setting up local file and location for database (DB!).
        NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [documentDirectories objectAtIndex:0];
        NSURL *storeURL = [NSURL fileURLWithPath:[documentDirectory stringByAppendingString:@"diaryStore.data"]];
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[DiaryStore model]];
        
        // Error Checking
        NSError *err;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&err]) {
            [NSException raise:@"Open Failed!!" format:@"Reason: %@", [err localizedDescription]];
            
        } else {
            diaryContext = [NSManagedObjectContext new];
            [diaryContext setPersistentStoreCoordinator:psc];
            
            // ??
            [diaryContext setUndoManager:nil];
        }
    }
    return diaryContext;
}



+(Entry *)makeNewEntryWithText:(NSString *)text AndWithImage:(UIImage *)image {
    // Make new entry object. Stick text into attribute.
    // Add to context.
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[DiaryStore context]];
    entry.text = text;
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.7);
    entry.photoData = imageData;
    
    return entry;
    
}

+(void)save {
    NSError *err;
    if (![[DiaryStore context] save:&err]) {
        [NSException raise:@"Save Failed!!" format:@"Reason: %@", [err localizedDescription]];
    }
    NSLog(@"Check saving entry!");
}

//baller code 
+(NSArray *)getAllFriends {
    return [self fetch:@"Friend"];
}

+(NSArray*)allEntries {
    return [self fetch:@"Entry"];
}

+(Friend *)addFriendWithName:(NSString *)name {
    Friend *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:[DiaryStore context]];
    friend.name = name;
    return friend;
}



// Helper Method
+(NSArray*)fetch:(NSString*)key {
    NSFetchRequest* req = [NSFetchRequest new];
    req.entity = [[DiaryStore model].entitiesByName objectForKey:key];
    NSError* err;
    NSArray* result = [[DiaryStore context] executeFetchRequest:req error:&err];
    if (!result) {
        [NSException raise:@"FetchFail" format:@"because: %@", [err localizedDescription]];
    }
    return result;
}

@end
