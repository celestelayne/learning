//
//  CalculatorExampleViewController.m
//  CalculatorExample
//
//  Created by hugo on 8/9/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "CalculatorExampleViewController.h"
#import "CalculatorExampleBrain.h"

@interface CalculatorExampleViewController()
    // For private stuff.
@property (nonatomic) BOOL userInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorExampleBrain *brain;
@end

@implementation CalculatorExampleViewController
@synthesize display;
@synthesize userInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

-(CalculatorExampleBrain *)brain {
    if(!_brain) _brain = [[CalculatorExampleBrain alloc]init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
    if (self.userInTheMiddleOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userInTheMiddleOfEnteringANumber = YES;
    }
    
}
- (IBAction)enterPressed{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    
    if(self.userInTheMiddleOfEnteringANumber){
        [self enterPressed];
    }
    
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}


 
@end
