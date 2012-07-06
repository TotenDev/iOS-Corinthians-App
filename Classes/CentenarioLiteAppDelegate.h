//
//  CentenarioLiteAppDelegate.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 09/11/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController ;

@interface CentenarioLiteAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	UIColor *tintColor;
	UIBarStyle barStyle;
	FirstViewController * vcONE ;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic,retain)UIColor* tintColor ;
@property(nonatomic,assign)UIBarStyle barStyle ;
@property(nonatomic,retain)FirstViewController* vcONE ;

- (void)setTabOrderIfSaved;
- (void)setBarStyle:(UIBarStyle)style andTintColor:(UIColor *)color forNavigationBar:(UINavigationBar *)bar ;

@end
