//
//  InputToolBar.m
//  Test2
//
//  Created by Kenny on 2015/3/13.
//  Copyright (c) 2015年 testttt. All rights reserved.
//

#import "InputToolBar.h"

@implementation InputToolBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //變更顏色的toolbar
        self.detailColorBar = [[UIToolbar alloc] initWithFrame:CGRectMake(frame.origin.x, 0, frame.size.width, frame.size.height/2)];
        _detailColorBar.hidden = YES;
        [self addSubview:_detailColorBar];
        
        //顏色toolbar的button
        self.blackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_blackBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
        [_blackBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_blackBtn setTitle:@"●" forState:UIControlStateNormal];
        [_blackBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.redBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_redBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
        [_redBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_redBtn setTitle:@"●" forState:UIControlStateNormal];
        [_redBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        self.blueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_blueBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
        [_blueBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_blueBtn setTitle:@"●" forState:UIControlStateNormal];
        [_blueBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        self.purpleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_purpleBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
        [_purpleBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_purpleBtn setTitle:@"●" forState:UIControlStateNormal];
        [_purpleBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];

        self.orangeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orangeBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
        [_orangeBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_orangeBtn setTitle:@"●" forState:UIControlStateNormal];
        [_orangeBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];

        UIBarButtonItem *blackItem = [[UIBarButtonItem alloc] initWithCustomView:_blackBtn];
        UIBarButtonItem *redItem = [[UIBarButtonItem alloc] initWithCustomView:_redBtn];
        UIBarButtonItem *blueItem = [[UIBarButtonItem alloc] initWithCustomView:_blueBtn];
        UIBarButtonItem *purpleItem = [[UIBarButtonItem alloc] initWithCustomView:_purpleBtn];
        UIBarButtonItem *orangeItem = [[UIBarButtonItem alloc] initWithCustomView:_orangeBtn];
        _detailColorBar.items = [NSArray arrayWithObjects:blackItem, redItem, blueItem, purpleItem, orangeItem, nil];
        
    
        
        
        //變更字體格式的toolbar
        _mainBar = [[UIToolbar alloc] initWithFrame:CGRectMake(frame.origin.x, frame.size.height/2, frame.size.width, frame.size.height/2)];
        
        //字體格式的btn
        _imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imgBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_imgBtn setTitle:@"圖" forState:UIControlStateNormal];
        [_imgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _colorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _colorBtn.selected = NO;
        [_colorBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_colorBtn addTarget:self action:@selector(colorHandler:) forControlEvents:UIControlEventTouchUpInside];
        [_colorBtn setTitle:@"●" forState:UIControlStateNormal];
        [_colorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _boldBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_boldBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_boldBtn addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        [_boldBtn setTitle:@"B" forState:UIControlStateNormal];
        [_boldBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [_boldBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _italicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_italicBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_italicBtn addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        [_italicBtn setTitle:@"斜" forState:UIControlStateNormal];
        [_italicBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [_italicBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _underlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_underlineBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_underlineBtn addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        [_underlineBtn setTitle:@"底" forState:UIControlStateNormal];
        [_underlineBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [_underlineBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        _strikeThroughBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_strikeThroughBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_strikeThroughBtn addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        [_strikeThroughBtn setTitle:@"刪" forState:UIControlStateNormal];
        [_strikeThroughBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [_strikeThroughBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doneBtn setFrame:CGRectMake(0, 0, 30, 30)];
        [_doneBtn addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
        [_doneBtn setTitle:@"D" forState:UIControlStateNormal];
        [_doneBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [_doneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        UIBarButtonItem *imgItem = [[UIBarButtonItem alloc] initWithCustomView:_imgBtn];
        UIBarButtonItem *colorItem = [[UIBarButtonItem alloc] initWithCustomView:_colorBtn];
        UIBarButtonItem *boldItem = [[UIBarButtonItem alloc] initWithCustomView:_boldBtn];
        UIBarButtonItem *italicItem = [[UIBarButtonItem alloc] initWithCustomView:_italicBtn];
        UIBarButtonItem *underlineItem = [[UIBarButtonItem alloc] initWithCustomView:_underlineBtn];
        UIBarButtonItem *strikeThroughItem = [[UIBarButtonItem alloc] initWithCustomView:_strikeThroughBtn];
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithCustomView:_doneBtn];
        
        _mainBar.items = [NSArray arrayWithObjects:imgItem, colorItem, boldItem, italicItem, underlineItem, strikeThroughItem, doneItem, nil];
        [self addSubview:_mainBar];
    }
    return self;
}


-(void)colorHandler:(UIButton *)sender
{
    if(sender.selected){
        sender.selected = NO;
        _detailColorBar.hidden = YES;
    }else{
        sender.selected = YES;
        _detailColorBar.hidden = NO;
    }
}

-(void)done:(UIButton *)sender
{
    [_inputDelegate responder];
}

-(void)typeChange:(UIButton *)sender
{
    if([sender isEqual:_boldBtn]){
        [_inputDelegate setType:@"Bold"];
    }
    if([sender isEqual:_italicBtn]){
        [_inputDelegate setType:@"Italic"];
    }
    if([sender isEqual:_underlineBtn]){
        [_inputDelegate setType:@"Underline"];
    }
    if([sender isEqual:_strikeThroughBtn]){
        [_inputDelegate setType:@"StrikeThrough"];
    }
    
}

-(void)colorChange:(UIButton *)sender
{
    _blackBtn.selected = NO;
    _redBtn.selected =NO;
    _blueBtn.selected = NO;
    _purpleBtn.selected = NO;
    _orangeBtn.selected = NO;
    sender.selected = YES;
    if([sender isEqual:_blackBtn]){
        [_colorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_inputDelegate setColor:@"Black"];
    }else if([sender isEqual:_redBtn]){
        [_colorBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_inputDelegate setColor:@"Red"];
    }else if([sender isEqual:_blueBtn]){
        [_colorBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_inputDelegate setColor:@"Blue"];
    }else if([sender isEqual:_purpleBtn]){
        [_colorBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [_inputDelegate setColor:@"Purple"];
    }else if([sender isEqual:_orangeBtn]){
        [_colorBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_inputDelegate setColor:@"Orange"];
    }
}
@end
