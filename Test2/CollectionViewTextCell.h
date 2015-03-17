//
//  CollectionViewTextCell.h
//  Test2
//
//  Created by Kenny on 2015/3/16.
//  Copyright (c) 2015年 testttt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGTextView.h"
@protocol FGWebViewDelegate <NSObject>
-(void)getWebViewHeight:(CGFloat)height forIndexPath:(NSIndexPath *)indexPath;
-(void)setFGTextView:(FGTextView *)fgTextView;
@end
@interface CollectionViewTextCell : UICollectionViewCell<UIWebViewDelegate>
@property (nonatomic, strong) FGTextView *fgTextView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (weak) id<FGWebViewDelegate> webDelegate;
@end
