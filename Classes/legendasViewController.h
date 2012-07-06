//
//  legendasViewController.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 25/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapDetectingImageView.h"

@interface legendasViewController : UIViewController <UIScrollViewDelegate,TapDetectingImageViewDelegate>{

	UIScrollView* imageScrollView ;

}

@end
