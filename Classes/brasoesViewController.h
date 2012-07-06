//
//  brasoesViewController.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 17/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapDetectingImageView.h"

@class applicationCellBrasoes ;

@interface brasoesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,TapDetectingImageViewDelegate> {

	IBOutlet UITableView* brasoesTableView ;
	applicationCellBrasoes* tmpCell ;
	NSArray* pathArray ;
	NSArray* megaArray ;
	NSTimer* timerFake ;
	UIScrollView* imageScrollView ;
//	IBOutlet UIImageView* brasaoAumentado ;
	TapDetectingImageView *imageView ;
}
-(void)animacaoDeZoom ;
-(void)animacaoDeZoomOut ;
@property(nonatomic,assign)IBOutlet applicationCellBrasoes* tmpCell ;

@end
