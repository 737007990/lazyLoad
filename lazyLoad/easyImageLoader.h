//
//  easyImageLoader.h
//  lazyLoad
//
//  Created by zy on 13-7-12.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyScrollView.h"

@interface easyImageLoader : UIScrollView<MyScrollViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) NSMutableArray  *viewControllers;
@property (strong, nonatomic) NSMutableArray *_imageArray;
@property (strong, nonatomic) NSMutableArray *_imagePathArray;
@property (strong, nonatomic) NSMutableArray *scrollViewArray;

///供固定的大量图片使用
-(void)loadImageWithImageArray:(NSMutableArray*)imageArray;

////供网络获取而来的图片使用，可刷新
-(void)loadImageWithImageArrayFromPathArray:(NSMutableArray *)imagePathArray;
-(void)reloadImageAt:(NSInteger)index;

@end

