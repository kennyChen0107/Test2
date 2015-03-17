//
//  InputToolBar.h
//  Test2
//
//  Created by Kenny on 2015/3/13.
//  Copyright (c) 2015年 testttt. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InputDelegate <NSObject>

@optional
-(void)setType:(NSString *)type;
-(void)setColor:(NSString *)color;
-(void)responder;
@end

@interface InputToolBar : UIToolbar
@property(nonatomic, weak) id<InputDelegate> inputDelegate;
@property(nonatomic, strong) UIToolbar *mainBar;
@property(nonatomic, strong) UIToolbar *detailColorBar;
@property(nonatomic, strong) UIButton *imgBtn;
@property(nonatomic, strong) UIButton *colorBtn;
@property(nonatomic, strong) UIButton *boldBtn;
@property(nonatomic, strong) UIButton *italicBtn;
@property(nonatomic, strong) UIButton *underlineBtn;
@property(nonatomic, strong) UIButton *strikeThroughBtn;

@property(nonatomic, strong) UIButton *doneBtn;

@property(nonatomic, strong) UIButton *redBtn;
@property(nonatomic, strong) UIButton *blackBtn;
@property(nonatomic, strong) UIButton *blueBtn;
@property(nonatomic, strong) UIButton *orangeBtn;
@property(nonatomic, strong) UIButton *purpleBtn;

@end
