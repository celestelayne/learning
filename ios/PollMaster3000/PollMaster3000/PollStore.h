//
//  PollStore.h
//  PollMaster3000
//
//  Created by hugo on 8/17/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PollStore : NSObject

+(void)setUpParseTable;

+(void)addPollQuestionToParse: (NSString *) pollQuestion;

+(void)addPollAnswerToParse: (NSString *) pollAnswer  forASpecificPollID:(NSString *)pollID;

+(NSArray *)getAllAnswersFromParse:(NSString *)pollID;

+(NSMutableDictionary *)getAllPollsFromParse;

@end
