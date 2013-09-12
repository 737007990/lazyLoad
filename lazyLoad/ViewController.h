//
//  ViewController.h
//  lazyLoad
//
//  Created by zy on 13-7-12.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyScrollView.h"
#import "easyImageLoader.h"

@interface ViewController : UIViewController<MyScrollViewDelegate,UIScrollViewDelegate>
@property (strong ,nonatomic)  easyImageLoader  *scrollView;
@property (strong, nonatomic) NSMutableArray  *viewControllers;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSMutableArray *scrollViewArray;

-(IBAction)reloadImage:(id)sender;

@end
