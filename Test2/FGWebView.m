//
//  FGWebView.m
//  Test2
//
//  Created by Kenny on 2015/3/13.
//  Copyright (c) 2015年 testttt. All rights reserved.
//

#import "FGWebView.h"
#import "objc/runtime.h"
@implementation FGWebView

-(id)inputAccessoryView
{
    return nil;
}

-(void)removeInputAccessoryView
{
    UIView* subview;
    
    for (UIView* view in self.scrollView.subviews) {
        if([[view.class description] hasPrefix:@"UIWeb"])
            subview = view;
    }
    
    if(subview == nil) return;
    
    NSString* name = [NSString stringWithFormat:@"%@_SwizzleHelper", subview.class.superclass];
    Class newClass = NSClassFromString(name);
    
    if(newClass == nil)
    {
        newClass = objc_allocateClassPair(subview.class, [name cStringUsingEncoding:NSASCIIStringEncoding], 0);
        if(!newClass) return;
        
        Method method = class_getInstanceMethod([FGWebView class], @selector(inputAccessoryView));
        class_addMethod(newClass, @selector(inputAccessoryView), method_getImplementation(method), method_getTypeEncoding(method));
        
        objc_registerClassPair(newClass);
    }
    
    object_setClass(subview, newClass);
}
@end
