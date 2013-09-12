//
//  easyImageLoader.m
//  lazyLoad
//
//  Created by zy on 13-7-12.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#import "easyImageLoader.h"

@implementation easyImageLoader
@synthesize viewControllers;
@synthesize _imageArray;
@synthesize _imagePathArray;
@synthesize scrollViewArray;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        // Initialization code
    }
    return self;
}

-(void)loadImageWithImageArray:(NSMutableArray*)imageArray{
    _imageArray = [[NSMutableArray alloc]initWithArray:imageArray];
    [self loadImageShow];
}


////////////
-(void)loadImageWithImageArrayFromPathArray:(NSMutableArray *)imagePathArray{
    _imagePathArray = [[NSMutableArray alloc]initWithArray:imagePathArray];
    for (NSString *path in imagePathArray) {
            [_imageArray addObject:NULL];
    }
}

-(void)reloadImageAt:(NSInteger)index{
    
    UIViewController  *controller2 = [self.viewControllers objectAtIndex:index];
    if ((NSNull *)controller2 != [NSNull null])
    {
        for (UIImageView *imageView in controller2.view.subviews) {
            imageView.image = nil;
        }
    }
    [self.viewControllers replaceObjectAtIndex:index withObject:[NSNull null]];
    
    UIImage *image = nil;
    if (_imagePathArray.count) {
        image = [[UIImage alloc] initWithContentsOfFile: [_imagePathArray objectAtIndex:index]];
    }
    else{
        image = [[UIImage alloc]init];
        image = [_imageArray objectAtIndex:index];
    }
    [_imageArray replaceObjectAtIndex:index withObject:image];
    [self loadScrollViewWithPage:index];
    [image release];
}
////////

-(void)singleTapGesture{
    
}

-(void)loadImageShow{    
    NSLog(@"page89023147987491028");
    if ([self.viewControllers count]) {
        
    }
    else{
        NSMutableArray *controllers = [[NSMutableArray alloc] init];
        for (unsigned i = 0; i < [_imageArray count]; i++)
        {
            [controllers addObject:[NSNull null]];
        }
        self.viewControllers = controllers;
        [controllers release];
        
    }
    self.contentSize = CGSizeMake(self.frame.size.width * [_imageArray count], self.frame.size.height);
    
    CGFloat pageWidth = self.frame.size.width;
    int page = floor((self.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if (page<[_imageArray count]-1) {
        if (page>0) {
            UIViewController  *controller1 = [self.viewControllers objectAtIndex:page-1];
            if ((NSNull *)controller1 != [NSNull null])
            {
                for (UIImageView *imageView in controller1.view.subviews) {
                    imageView.image = nil;
                }
            }
        }
        UIViewController  *controller2 = [self.viewControllers objectAtIndex:page];
        if ((NSNull *)controller2 != [NSNull null])
        {
            for (UIImageView *imageView in controller2.view.subviews) {
                imageView.image = nil;
            }
        }
        UIViewController  *controller3 = [self.viewControllers objectAtIndex:page+1];
        if ((NSNull *)controller3 != [NSNull null])
        {
            for (UIImageView *imageView in controller3.view.subviews) {
                imageView.image = nil;
            }
        }
        NSLog(@"lologPageHeieI   1");
        
        if (page>0) {
            [self.viewControllers replaceObjectAtIndex:page-1 withObject:[NSNull null]];
        }
        NSLog(@"lologPageHeieI     2");
        [self.viewControllers replaceObjectAtIndex:page withObject:[NSNull null]];
        [self.viewControllers replaceObjectAtIndex:page+1 withObject:[NSNull null]];
        
        if (page >0) {
            [self loadScrollViewWithPage:page-1];
        }
        [self loadScrollViewWithPage:page];
        [self loadScrollViewWithPage:page+1];
    }
    
    NSLog(@"lologPageHeieI     3");
}


-(UIViewController*)getTheController:(NSInteger)page viewController:(UIViewController*)viewController{
    
    NSLog(@"wwwwwww");
 
    UIImage *getImage = [_imageArray objectAtIndex:page];
    
    MyScrollView  *scrollViewForScale = [[MyScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scrollViewForScale.scollViewDelegate = self;
    
    scrollViewForScale.image = getImage;
    [scrollViewArray addObject:scrollViewForScale];
    
    
    [viewController.view addSubview:scrollViewForScale];
    
    [scrollViewForScale release];
    scrollViewForScale = nil;
    
    
    NSLog(@"ttttttttttt");
    
    return viewController;
    
}


- (void)loadScrollViewWithPage:(int)page
{
    
    NSLog(@"pagezzy");
    if (page < 0)
        return;
    if (page >= [_imageArray count])
        return;
    
    // replace the placeholder if necessary
    UIViewController  *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null])
    {
        controller = [[UIViewController alloc] init];
        [self getTheController:page viewController:controller];
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
        [controller release];
    }
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = self.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self addSubview:controller.view];
    }
    NSLog(@"pagezzyyyyyy");
}




- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    
    NSLog(@"page1233");
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.frame.size.width;
    int page = floor((self.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    
    if (page>2 &&page<[_imageArray count]-3) {
        UIViewController  *controller1 = [self.viewControllers objectAtIndex:page-2];
        if ((NSNull *)controller1 != [NSNull null])
        {
            for (UIImageView *imageView in controller1.view.subviews) {
                imageView.image = nil;
            }
        }
        
        UIViewController  *controller2 = [self.viewControllers objectAtIndex:page-3];
        if ((NSNull *)controller2 != [NSNull null])
        {
            for (UIImageView *imageView in controller2.view.subviews) {
                imageView.image = nil;
            }
        }
        
        UIViewController  *controller3 = [self.viewControllers objectAtIndex:page+2];
        if ((NSNull *)controller3 != [NSNull null])
        {
            for (UIImageView *imageView in controller3.view.subviews) {
                imageView.image = nil;
            }
        }
        
        UIViewController  *controller4 = [self.viewControllers objectAtIndex:page+3];
        if ((NSNull *)controller4 != [NSNull null])
        {
            for (UIImageView *imageView in controller4.view.subviews) {
                imageView.image = nil;
            }
        }
        [self.viewControllers replaceObjectAtIndex:page-2 withObject:[NSNull null]];
        [self.viewControllers replaceObjectAtIndex:page-3 withObject:[NSNull null]];
        [self.viewControllers replaceObjectAtIndex:page+2 withObject:[NSNull null]];
        [self.viewControllers replaceObjectAtIndex:page+3 withObject:[NSNull null]];
    }
    NSLog(@"%d",page);
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
