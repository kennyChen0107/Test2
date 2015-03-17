//
//  FGTextView.h
//  Test2
//
//  Created by Kenny on 2015/3/12.
//  Copyright (c) 2015年 testttt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGWebView.h"



@interface FGTextView : UIView<UIWebViewDelegate>
@property (nonatomic, strong) FGWebView *webView;
-(void)setTextType:(NSString *)type;
-(void)setTextColor:(NSString *)color;
-(CGFloat)getContentHeight;
-(NSString *)getBody;

@end
