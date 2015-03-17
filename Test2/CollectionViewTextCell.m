//
//  CollectionViewTextCell.m
//  Test2
//
//  Created by Kenny on 2015/3/16.
//  Copyright (c) 2015年 testttt. All rights reserved.
//

#import "CollectionViewTextCell.h"

@implementation CollectionViewTextCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _fgTextView = [[FGTextView alloc] init];
        _fgTextView.webView.delegate = self;
        _fgTextView.contentMode = UIViewContentModeScaleAspectFill;
        _fgTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = request.URL.absoluteString;
    if( [urlString hasPrefix:@"js-call:"])
    {
        [_webDelegate getWebViewHeight:[[_fgTextView.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('content').offsetHeight;"]floatValue] forIndexPath:_indexPath];
        return NO;
    }
    if( [urlString hasPrefix:@"click-call:"])
    {
        [_webDelegate setFGTextView:_fgTextView];
        return NO;
    }
    return YES;
}


    
@end
