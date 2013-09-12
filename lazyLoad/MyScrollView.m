//
//  MyScrollView.m
//  BabyPlus
//
//  Created by zy on 12-11-12.
//
//

#import "MyScrollView.h"


@implementation MyScrollView


@synthesize image;
@synthesize imageView;
@synthesize scollViewDelegate;


#pragma mark -
#pragma mark === Intilization ===
#pragma mark -
- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
	{
		self.delegate = self;
		self.minimumZoomScale = 0.5;
		self.maximumZoomScale = 2.5;
		self.showsVerticalScrollIndicator = NO;
		self.showsHorizontalScrollIndicator = NO;
		
		imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		imageView.contentMode = UIViewContentModeScaleAspectFit;
    
		[self addSubview:imageView];
    }
    return self;
}

- (void)setImage:(UIImage *)img
{
	imageView.image = img;
}

#pragma mark -
#pragma mark === UIScrollView Delegate ===
#pragma mark -
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale                                                                        //双指放大缩小
{
	//NSLog(@"%s", _cmd);
	
	CGFloat zs = scrollView.zoomScale;
	zs = MAX(zs, 1.0);
	zs = MIN(zs, 2.0);
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	scrollView.zoomScale = zs;
	[UIView commitAnimations];
}

#pragma mark -
#pragma mark === UITouch Delegate ===
#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if ([touch tapCount] == 2)                                                      //双击放大图片
	{
		CGFloat zs = self.zoomScale;
		zs = (zs == 1.0) ? 2.0 : 1.0;
		
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3];
		self.zoomScale = zs;
		[UIView commitAnimations];
	}
    if ([scollViewDelegate respondsToSelector:@selector(singleTapGesture)]) {
        [scollViewDelegate performSelector:@selector(singleTapGesture)];
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

-(BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view{
   
    return NO;
}
@end
