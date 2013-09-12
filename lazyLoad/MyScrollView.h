//
//  MyScrollView.h
//  BabyPlus
//
//  Created by zy on 12-11-12.
//
//

#import <UIKit/UIKit.h>
@protocol MyScrollViewDelegate <NSObject>;
-(void)singleTapGesture;
@end

@interface MyScrollView : UIScrollView <UIScrollViewDelegate>
{
	UIImage *image;
	UIImageView *imageView;
}

@property (assign, nonatomic) id<MyScrollViewDelegate>  scollViewDelegate;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImageView    *imageView;

@end
