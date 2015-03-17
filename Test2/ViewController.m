//
//  ViewController.m
//  Test2
//
//  Created by Kenny on 2015/3/12.
//  Copyright (c) 2015年 testttt. All rights reserved.
//

#import "ViewController.h"
#import "FGTextView.h"
#import "InputToolBar.h"
#import "CollectionViewTextCell.h"

@interface ViewController ()<UIActionSheetDelegate, UIWebViewDelegate, InputDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, FGWebViewDelegate>
{
    FGTextView *targetFGTextView;
    InputToolBar *toolBar;
    NSMutableDictionary *dict;
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dict = [[NSMutableDictionary alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowFrame:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(80 , 33)];
    
    
    self.mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    [self.mainCollectionView registerClass:[CollectionViewTextCell class]forCellWithReuseIdentifier:@"cellID"];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.backgroundColor = [UIColor clearColor];
    self.mainCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_mainCollectionView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark CollectionView Method

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    CollectionViewTextCell *cell = (CollectionViewTextCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell.fgTextView removeFromSuperview];
    cell.webDelegate = self;
    cell.indexPath = indexPath;
    cell.fgTextView.frame = cell.bounds;
    [cell.contentView addSubview:cell.fgTextView];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, [[dict objectForKey:[NSString stringWithFormat:@"%lu", indexPath.row]]doubleValue] + 25);
}

#pragma mark Keyboard Method
-(void)keyboardWillHidden:(NSNotification*)notif
{
    //鍵盤消失移除toolBar
    toolBar.inputDelegate = nil;
    [toolBar removeFromSuperview];
    [self.mainCollectionView setFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    //鍵盤消失timer停止
    [timer invalidate];
}

-(void)keyboardWillShowFrame:(NSNotification*)notif{
    
    [self.mainCollectionView setFrame:CGRectMake(_mainCollectionView.frame.origin.x, _mainCollectionView.frame.origin.y , _mainCollectionView.frame.size.width, 300)];
    
    //鍵盤的frame
    CGRect keyBoardFrame = [[[notif userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    toolBar = [[InputToolBar alloc] initWithFrame:CGRectMake(keyBoardFrame.origin.x, keyBoardFrame.origin.y - 80, keyBoardFrame.size.width, 80)];
    
    toolBar.inputDelegate = self;
    [self.view addSubview:toolBar];

    //timer是為了偵測html編輯器的游標位置，抓出目前格式設定的狀態
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkSelection:) userInfo:nil repeats:YES];
}


#pragma mark Timer Method
- (void)checkSelection:(id)sender {
    
    toolBar.boldBtn.selected = [[targetFGTextView.webView stringByEvaluatingJavaScriptFromString:@"document.queryCommandState('Bold')"] boolValue];
    toolBar.italicBtn.selected = [[targetFGTextView.webView stringByEvaluatingJavaScriptFromString:@"document.queryCommandState('Italic')"] boolValue];
    toolBar.underlineBtn.selected = [[targetFGTextView.webView stringByEvaluatingJavaScriptFromString:@"document.queryCommandState('Underline')"] boolValue];
    toolBar.strikeThroughBtn.selected = [[targetFGTextView.webView stringByEvaluatingJavaScriptFromString:@"document.queryCommandState('StrikeThrough')"] boolValue];
    
    NSString *foreColor = [targetFGTextView.webView stringByEvaluatingJavaScriptFromString:@"document.queryCommandValue('foreColor')"];
    
    if([foreColor isEqualToString:@"rgb(0, 0, 0)"]){
        [toolBar.colorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else if([foreColor isEqualToString:@"rgb(0, 0, 255)"]){
        [toolBar.colorBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }else if([foreColor isEqualToString:@"rgb(255, 0, 0)"]){
        [toolBar.colorBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }else if([foreColor isEqualToString:@"rgb(128, 0, 128)"]){
        [toolBar.colorBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    }else if([foreColor isEqualToString:@"rgb(255, 165, 0)"]){
        [toolBar.colorBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
}

#pragma mark CellDelegate
//cell的delegate 點擊fgtextview的webview時，將點擊的webview指定給target
-(void)setFGTextView:(FGTextView *)fgTextView
{
    targetFGTextView = fgTextView;
}

-(void)getWebViewHeight:(CGFloat)height forIndexPath:(NSIndexPath *)indexPath
{
    if([[dict objectForKey:[NSString stringWithFormat:@"%lu", indexPath.row]]doubleValue] != height){
        [dict setObject:[NSNumber numberWithDouble:height] forKey:[NSString stringWithFormat:@"%lu", indexPath.row]];
        
        [self.mainCollectionView performBatchUpdates:^(void) {
            
            [self.mainCollectionView reloadInputViews];
            if(height > 270){
                [_mainCollectionView setContentSize:CGSizeMake(0, height + 30)];
                [_mainCollectionView setContentOffset:CGPointMake(0, _mainCollectionView.contentOffset.y + 20)];
            }
            
        } completion:nil];
    }
}

#pragma mark JavaScript Method
//設定目標的文字格式
-(void)setType:(NSString *)type
{
    [targetFGTextView setTextType:type];
}

//設定目標的文字顏色
-(void)setColor:(NSString *)color
{
    [targetFGTextView setTextColor:color];
}

//使鍵盤消失
-(void)responder
{
    [targetFGTextView.webView stringByEvaluatingJavaScriptFromString:@"document.activeElement.blur()"];;
}

@end
