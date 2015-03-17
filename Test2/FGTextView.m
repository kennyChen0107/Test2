//
//  FGTextView.m
//  Test2
//
//  Created by Kenny on 2015/3/12.
//  Copyright (c) 2015年 testttt. All rights reserved.
//

#import "FGTextView.h"
#import "FGWebView.h"
@implementation FGTextView

-(id)init
{
    self = [super init];
    if(self){
        NSString *html = @"<html><style type='text/css'>html,body{overflow:hidden;}</style><script type='text/javascript'>function clickFunction(){window.location='click-call:runObjMethod';}function callObjFunction(){window.location='js-call:runObjMethod';}</script><body id='bodyonline'><div id='content' contenteditable='true' onKeyDown='callObjFunction()' onClick='clickFunction()'> </div></body></html>";
        NSString *docsFolder = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *filename = [docsFolder stringByAppendingPathComponent:@"index.html"];
        
        NSError *error;
        [html writeToFile:filename atomically:NO encoding:NSUTF8StringEncoding error:&error];
        
        NSURL *url = [NSURL fileURLWithPath:filename];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        _webView = [[FGWebView alloc] init];
        _webView.scrollView.scrollEnabled = NO;
        [_webView removeInputAccessoryView];
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_webView];
        [_webView loadRequest:request];

    }
    return self;
}

//改變文字格式
-(void)setTextType:(NSString *)type
{
    [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.execCommand('%@')", type]];
}
//改變文字顏色
-(void)setTextColor:(NSString *)color
{
    [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.execCommand('foreColor','', '%@')", color]];
}
//取得WebView的內容高度
-(CGFloat)getContentHeight
{
    return [[_webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('content').offsetHeight;"]floatValue];
}

//取得WebView的html
-(NSString *)getBody
{
    return [_webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.outerHTML"];
}



@end
