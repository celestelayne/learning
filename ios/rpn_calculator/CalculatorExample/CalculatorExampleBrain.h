//
//  CalculatorExampleBrain.h
//  CalculatorExample
//
//  Created by hugo on 8/9/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorExampleBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end
