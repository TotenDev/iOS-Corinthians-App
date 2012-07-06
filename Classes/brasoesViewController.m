//
//  brasoesViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 17/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "brasoesViewController.h"
#import "applicationCellBrasoes.h"

#define ZOOM_STEP_OUT 10.0
#define ZOOM_VIEW_TAG 200
#define ZOOM_STEP 1.5 

@interface brasoesViewController (UtilityMethods)
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;
@end


@implementation brasoesViewController

@synthesize tmpCell ;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Brasões" ;
	NSString* path = [[NSBundle mainBundle]pathForResource:@"brasoesDB" ofType:@"plist"];
	pathArray = [[NSArray alloc]initWithContentsOfFile:path];
	NSDictionary* mainDict = [pathArray objectAtIndex:0];
	megaArray = [mainDict objectForKey:@"brasoesArray"];
//	NSLog(@"i%",[megaArray count]);
	brasoesTableView.rowHeight = 110.0; ;
	brasoesTableView.backgroundColor = [UIColor clearColor];
	brasoesTableView.separatorColor = [UIColor clearColor];
//	brasaoAumentado.hidden = YES ;
//	brasaoAumentado.alpha = 0.0 ;
	
		
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return [megaArray count];
}

	// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath :(NSIndexPath *)indexPath 
{	
	static NSString *CellIdentifier = @"applicationCellBrasoes";
    
    applicationCellBrasoes *cell = (applicationCellBrasoes *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle]loadNibNamed:@"brasoesSubviewCell" owner:self options:nil];
		cell = tmpCell ; 
		self.tmpCell = nil ;
		
	}
	NSDictionary* megaDict = [megaArray objectAtIndex:indexPath.row];
	cell.periodoBrasao = [megaDict objectForKey:@"periodoBrasao"];
	cell.sobreBrasao = [megaDict objectForKey:@"sobreBrasao"];
	cell.imageBrasao = [UIImage imageNamed:[megaDict objectForKey:@"imageBrasao"]];
	
	return cell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSDictionary* mainDict = [megaArray objectAtIndex:indexPath.row];
	NSString* imageToBe = [mainDict objectForKey:@"imageAmpliadaBrasao"];
	NSLog(@"%@",imageToBe);
		// set up main scroll view | MUST RELEASE |
    imageScrollView = [[UIScrollView alloc] initWithFrame:[[self view] bounds]];
    [imageScrollView setBackgroundColor:[UIColor clearColor]];
    [imageScrollView setDelegate:self];
    [imageScrollView setBouncesZoom:YES];
	imageScrollView.hidden = YES;
    [[self view] addSubview:imageScrollView];
	
	
	imageView = [[TapDetectingImageView alloc] initWithImage:[UIImage imageNamed:imageToBe]];
		//Setando hidden e nao funcionais / alphas
	imageScrollView.hidden = NO ;
	imageView.alpha = 0.0 ;
	imageView.hidden = NO ;
	brasoesTableView.allowsSelection = NO ;
	brasoesTableView.multipleTouchEnabled = NO ;
	
    [imageView setDelegate:self];
    [imageView setTag:ZOOM_VIEW_TAG];
	imageView.contentMode = UIViewContentModeScaleToFill ;
	[imageScrollView setContentSize:CGSizeMake(320, 367)];
    [imageScrollView addSubview:imageView];
    [imageView release];
    
		// calculate minimum scale to perfectly fit image width, and begin at that scale
    float minimumScale = [imageScrollView frame].size.width / [imageView frame].size.width;
	float maximumScale = ([imageView frame].size.width / [imageView frame].size.width)*2.5;
	[imageScrollView setMaximumZoomScale:maximumScale];
    [imageScrollView setMinimumZoomScale:minimumScale];
    [imageScrollView setZoomScale:minimumScale];
	imageView.transform = CGAffineTransformMakeScale(0.15625, 0.104166666666667);

	timerFake = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animacaoDeZoom) userInfo:nil repeats:YES];

}

-(void)animacaoDeZoom {
	
	[UIView beginAnimations:@"animation1" context:nil];
//	[UIView setAnimationCurve:1.0];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelay:0.05];
	NSLog(@"passei por aqui");
//	brasaoAumentado.center = CGPointMake(0,0);
	imageView.transform = CGAffineTransformMakeScale(1,1);
	imageView.alpha = imageView.alpha + 0.2 ;
	[UIView commitAnimations];
	if (imageView.alpha >= 1.0) {
		[timerFake invalidate];
		[imageScrollView setBackgroundColor:[UIColor grayColor]];
	}
}

-(void)animacaoDeZoomOut {
	[UIView beginAnimations:@"animation2" context:nil];
		//	[UIView setAnimationCurve:1.0];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelay:0.05];
	NSLog(@"passei por aqui");
		//	brasaoAumentado.center = CGPointMake(0,0);
	imageView.transform = CGAffineTransformMakeScale(0.15625, 0.104166666666667);
	imageView.alpha = imageView.alpha - 0.4 ;
	[UIView commitAnimations];
	if (imageView.alpha <= 0.0) {
		[timerFake invalidate];
		imageView.hidden = YES ;
		imageScrollView.hidden = YES ;
		[imageScrollView release];
	}
}

#pragma mark UIScrollViewDelegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	NSLog(@"scrolling");
    return [imageScrollView viewWithTag:ZOOM_VIEW_TAG];
}

/************************************** NOTE **************************************/
/* The following delegate method works around a known bug in zoomToRect:animated: */
/* In the next release after 3.0 this workaround will no longer be necessary      */
/**********************************************************************************/
	//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
	//    [scrollView setZoomScale:scale+0.01 animated:NO];
	//    [scrollView setZoomScale:scale animated:NO];
	//}

#pragma mark TapDetectingImageViewDelegate methods

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotSingleTapAtPoint:(CGPoint)tapPoint {
	[imageScrollView setBackgroundColor:[UIColor clearColor]];
	timerFake = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animacaoDeZoomOut) userInfo:nil repeats:YES];
	brasoesTableView.allowsSelection = YES ;
	brasoesTableView.multipleTouchEnabled = YES ;
}

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotDoubleTapAtPoint:(CGPoint)tapPoint {
//		// double tap 
	//[UIView beginAnimations:@"animation3" context:nil];
//	[UIView setAnimationDuration:0.1];
//	imageView.transform = CGAffineTransformMakeScale(1,1);
//	imageView.center = CGPointMake(320/2, 367/2);
//	[imageScrollView setContentSize:CGSizeMake(320, 367)];
//	[imageScrollView setCenter:CGPointMake(320/2, 367/2)];
//	[UIView commitAnimations];
	
	
		//TEST
	float newScale = [imageScrollView zoomScale] / ZOOM_STEP_OUT;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:tapPoint];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotTwoFingerTapAtPoint:(CGPoint)tapPoint {
		// two-finger tap zooms out
	NSLog(@"TWO-FINGER TAPS");
    float newScale = [imageScrollView zoomScale] / ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:tapPoint];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}

#pragma mark Utility methods

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    NSLog(@"cgrect");
    CGRect zoomRect;
    
		// the zoom rect is in the content view's coordinates. 
		//    At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
		//    As the zoom scale decreases, so more content is visible, the size of the rect grows.
    zoomRect.size.height = [imageScrollView frame].size.height / scale;
    zoomRect.size.width  = [imageScrollView frame].size.width  / scale;
    
		// choose an origin so as to get the right center.
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[brasoesTableView release];
	[tmpCell release];
	[pathArray release];
//	[megaArray release];
	//if (timerFake == !nil) {
//		[timerFake release];
//	}
//	if (imageScrollView == !nil) {
//		[imageScrollView release];
//	}
    [super dealloc];
}


@end
