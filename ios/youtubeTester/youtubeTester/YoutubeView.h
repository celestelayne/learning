//
//  YoutubeView.h
//  youtubeTester
//
//  Created by hugo on 8/26/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YoutubeView : UIWebView

- (YoutubeView *)initWithStringAsURL:(NSString *)urlString frame:(CGRect)frame;

@end
