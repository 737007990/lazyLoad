//
//  ViewController.m
//  lazyLoad
//
//  Created by zy on 13-7-12.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollView;
@synthesize viewControllers;
@synthesize imageArray;
@synthesize scrollViewArray;


- (void)viewDidLoad
{
    [super viewDidLoad];
    imageArray = [[NSMutableArray alloc] init];
    int n;
    for (n=1 ; n<5; n++) {
        UIImage *image =[[UIImage alloc]init];
        image =  [UIImage imageNamed:[NSString stringWithFormat:@"%d",n]];
        [imageArray addObject:image];
        if ( imageArray.count <200&& n == 4) {
            n = 0;
        }
    }
    scrollView = [[easyImageLoader alloc]initWithFrame:CGRectMake(0, 50, 320, 410)];
    scrollView.pagingEnabled = YES;
    [scrollView loadImageWithImageArray:imageArray];
    [self.view addSubview:scrollView];
      
    


	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)reloadImage:(id)sender{
    [scrollView reloadImageAt:1];
}



//-(void)loadImageShow{
//    //    NSInteger imageIndex = 0;
//    //    CGFloat   contentWidth = 0;
//    
//    NSLog(@"page89023147987491028");
//    if ([self.viewControllers count]) {
//        
//    }
//    else{
//        NSMutableArray *controllers = [[NSMutableArray alloc] init];
//        for (unsigned i = 0; i < [imageArray count]; i++)
//        {
//            [controllers addObject:[NSNull null]];
//        }
//        self.viewControllers = controllers;
//        [controllers release];
//        
//    }
//    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [imageArray count], scrollView.frame.size.height);
//    
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    
//    if (page<[imageArray count]-1) {
//        if (page>0) {
//            UIViewController  *controller1 = [self.viewControllers objectAtIndex:page-1];
//            if ((NSNull *)controller1 != [NSNull null])
//            {
//                for (UIImageView *imageView in controller1.view.subviews) {
//                    imageView.image = nil;
//                }
//            }
//        }
//        UIViewController  *controller2 = [self.viewControllers objectAtIndex:page];
//        if ((NSNull *)controller2 != [NSNull null])
//        {
//            for (UIImageView *imageView in controller2.view.subviews) {
//                imageView.image = nil;
//            }
//        }
//        UIViewController  *controller3 = [self.viewControllers objectAtIndex:page+1];
//        if ((NSNull *)controller3 != [NSNull null])
//        {
//            for (UIImageView *imageView in controller3.view.subviews) {
//                imageView.image = nil;
//            }
//        }
//        NSLog(@"lologPageHeieI   1");
//        
//        if (page>0) {
//            [self.viewControllers replaceObjectAtIndex:page-1 withObject:[NSNull null]];
//        }
//        NSLog(@"lologPageHeieI     2");
//        [self.viewControllers replaceObjectAtIndex:page withObject:[NSNull null]];
//        [self.viewControllers replaceObjectAtIndex:page+1 withObject:[NSNull null]];
//        
//        if (page >0) {
//            [self loadScrollViewWithPage:page-1];
//        }
//        [self loadScrollViewWithPage:page];
//        [self loadScrollViewWithPage:page+1];
//    }
//    
//    NSLog(@"lologPageHeieI     3");
//}
//
//
//-(UIViewController*)getTheController:(NSInteger)page viewController:(UIViewController*)viewController{
//    
//    NSLog(@"wwwwwww");
//    
////    ImageNewsImage *newsImage = [imageNewsItem.imageArray objectAtIndex:page];
//    UIImage *getImage = [imageArray objectAtIndex:page];
//    
//    MyScrollView  *scrollViewForScale = [[MyScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, scrollView.frame.size.height)];
//    scrollViewForScale.scollViewDelegate = self;
//    
//    if (page == 0) {
//        //        titleLabel.text = imageNewsItem.name;
//        //        sequenceLabel.text = [NSString stringWithFormat:@"%d/%d", page + 1, [imageNewsItem.imageArray count]];
//        //        descriptionTextView.text = newsImage.description;
////        descriptionTextView.text = [NSString stringWithFormat:@"%d/%d  %@",page + 1, [imageNewsItem.imageArray count],newsImage.description];
//    }
//    
////    NSString *imagePath = [NSString stringWithFormat:@"%@/%@", [CommonFunction newsFilePath], [newsImage.url2 lastPathComponent]];
//     
////    if (![[NSFileManager defaultManager] fileExistsAtPath:imagePath]) {
////        DownloadBinaryOperation *operation = [[DownloadBinaryOperation alloc] initWithDelegate:self];
////        operation.code = page;
////        operation.savePath = imagePath;
////        operation.downloadUrl = newsImage.url2;
////        [[GlobalParameter sharedInstance] runOperation:operation];
////        [operationArray addObject:operation];
////        
////        [operation release];
////        operation = nil;
////    }
////    else{
//    scrollViewForScale.image = getImage;
//    //    }
//    
//    //    if (page == [imageNewsItem.imageArray count]-1) {
//    //        UISwipeGestureRecognizer *swipeRightGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handelSwipe:)];
//    //        [swipeRightGes setDirection:UISwipeGestureRecognizerDirectionRight];
//    //        [scrollViewForScale.imageView addGestureRecognizer:swipeRightGes];
//    //        [swipeRightGes release];
//    //        swipeRightGes = nil;
//    //    }
//    [scrollViewArray addObject:scrollViewForScale];
//    
//    
//    [viewController.view addSubview:scrollViewForScale];
//    
//    [scrollViewForScale release];
//    scrollViewForScale = nil;
//    
//    
//    NSLog(@"ttttttttttt");
//    
//    return viewController;
//    
//}
//
//
//- (void)loadScrollViewWithPage:(int)page
//{
//    
//    NSLog(@"pagezzy");
//    if (page < 0)
//        return;
//    if (page >= [imageArray count])
//        return;
//    
//    // replace the placeholder if necessary
//    UIViewController  *controller = [self.viewControllers objectAtIndex:page];
//    if ((NSNull *)controller == [NSNull null])
//    {
//        controller = [[UIViewController alloc] init];
//        [self getTheController:page viewController:controller];
//        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
//        [controller release];
//    }
//    
//    // add the controller's view to the scroll view
//    if (controller.view.superview == nil)
//    {
//        CGRect frame = scrollView.frame;
//        frame.origin.x = frame.size.width * page;
//        frame.origin.y = 0;
//        controller.view.frame = frame;
//        [scrollView addSubview:controller.view];
//    }
//    NSLog(@"pagezzyyyyyy");
//}
//
//
//
//
//- (void)scrollViewDidScroll:(UIScrollView *)sender
//{
//    
//    NSLog(@"page1233");
//    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
//    // which a scroll event generated from the user hitting the page control triggers updates from
//    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
//    
//    // Switch the indicator when more than 50% of the previous/next page is visible
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    
//    
//    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
//    [self loadScrollViewWithPage:page - 1];
//    [self loadScrollViewWithPage:page];
//    [self loadScrollViewWithPage:page + 1];
//    
////    ImageNewsImage *newsImage = [imageNewsItem.imageArray objectAtIndex:page];
//   
//    //    titleLabel.text = imageNewsItem.name;
//    //    sequenceLabel.text = [NSString stringWithFormat:@"%d/%d", page + 1, [imageNewsItem.imageArray count]];
//    //    descriptionTextView.text = newsImage.description;
////    descriptionTextView.text = [NSString stringWithFormat:@"%d/%d  %@",page + 1, [imageNewsItem.imageArray count],newsImage.description];
//    
//    
//    
//    
//    if (page>2 &&page<[imageArray count]-3) {
//        UIViewController  *controller1 = [self.viewControllers objectAtIndex:page-2];
//        if ((NSNull *)controller1 != [NSNull null])
//        {
//            for (UIImageView *imageView in controller1.view.subviews) {
//                imageView.image = nil;
//            }
//        }
//        
//        UIViewController  *controller2 = [self.viewControllers objectAtIndex:page-3];
//        if ((NSNull *)controller2 != [NSNull null])
//        {
//            for (UIImageView *imageView in controller2.view.subviews) {
//                imageView.image = nil;
//            }
//        }
//        
//        UIViewController  *controller3 = [self.viewControllers objectAtIndex:page+2];
//        if ((NSNull *)controller3 != [NSNull null])
//        {
//            for (UIImageView *imageView in controller3.view.subviews) {
//                imageView.image = nil;
//            }
//        }
//        
//        UIViewController  *controller4 = [self.viewControllers objectAtIndex:page+3];
//        if ((NSNull *)controller4 != [NSNull null])
//        {
//            for (UIImageView *imageView in controller4.view.subviews) {
//                imageView.image = nil;
//            }
//        }
//        [self.viewControllers replaceObjectAtIndex:page-2 withObject:[NSNull null]];
//        [self.viewControllers replaceObjectAtIndex:page-3 withObject:[NSNull null]];
//        [self.viewControllers replaceObjectAtIndex:page+2 withObject:[NSNull null]];
//        [self.viewControllers replaceObjectAtIndex:page+3 withObject:[NSNull null]];
//    }
//    NSLog(@"%d",page);
//    //    if (page == [imageNewsItem.imageArray count]-1) {
//    //        if (self.interfaceOrientation == UIInterfaceOrientationPortrait &&showCount ==0){
//    //            showCount =1;
//    //             [self performSegueWithIdentifier:@"EnterCriticismListPage" sender:self];
//    //        }
//    //    }
//    
//    // A possible optimization would be to unload the views+controllers which are no longer visible
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
