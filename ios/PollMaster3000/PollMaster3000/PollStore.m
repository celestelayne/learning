//
//  PollStore.m
//  PollMaster3000
//
//  Created by hugo on 8/17/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "PollStore.h"
#import <Parse/Parse.h>

@implementation PollStore

// Set Up Parse Table


// Sets up Parse for the first time.
+(void) setUpParseTable
{
    [Parse setApplicationId:@"5oRr79XazWtqbFJgpJTXq4LQNns6RjwVQDANh7gx"
                  clientKey:@"jeTgP8gg5nWdPRjgGsCqBEm3sSeNwI4F9GXi1uVw"];
}


+(void)addPollQuestionToParse:(NSString *)pollQuestion
{
    PFObject *questionTable = [PFObject objectWithClassName:@"questionTable"];
    [questionTable setObject:pollQuestion forKey:@"questionText"];
    [questionTable save];
}

+(void)addPollAnswerToParse: (NSString *) pollAnswer forASpecificPollID:(NSString *)pollID
{
    PFObject *resultsTable = [PFObject objectWithClassName:@"resultsTable"];
    [resultsTable setObject:pollAnswer forKey:@"answerText"];
    [resultsTable setObject:pollID forKey:@"pollID"];
    [resultsTable save];
}

+(NSArray *)getAllAnswersFromParse:(NSString *)pollID
{
    PFQuery *query = [PFQuery queryWithClassName:@"resultsTable"];
    [query whereKey:@"pollID" equalTo:pollID];
    NSArray *queryResults = [query findObjects];
    return queryResults;
}

+(NSMutableDictionary *)getAllPollsFromParse
{
    PFQuery *query = [PFQuery queryWithClassName:@"questionTable"];
    NSArray *queryResults = [query findObjects];
    NSMutableDictionary *dictionaryResult = [[NSMutableDictionary alloc] init];
    
    
    for (PFObject *queryResult in queryResults)
    {
        NSString *question = [queryResult objectForKey:@"questionText"];
        NSString *objectId = queryResult.objectId;
        [dictionaryResult  setObject:question forKey:objectId];
    }
    return dictionaryResult;
}
     

@end
