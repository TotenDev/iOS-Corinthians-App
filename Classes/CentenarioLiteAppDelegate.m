//
//  CentenarioLiteAppDelegate.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 09/11/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "CentenarioLiteAppDelegate.h"
#import "FirstViewController.h"


@implementation CentenarioLiteAppDelegate

@synthesize window;
@synthesize tabBarController  ,vcONE ;
@synthesize tintColor,barStyle ;


- (void)applicationDidFinishLaunching:(UIApplication *)application {

	[self setTabOrderIfSaved];
	vcONE = [FirstViewController new];
	for (UIViewController* tabBarView in tabBarController.viewControllers) {
	
		NSLog(@"%@",tabBarView.title);
	}

	barStyle = UIBarStyleBlack ;
	[self setBarStyle:barStyle andTintColor:tintColor forNavigationBar:tabBarController.moreNavigationController.navigationBar];
//	[self setBarStyle:barStyle andTintColor:tintColor forNavigationBar:tabBarController.navigationController.navigationBar];
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
	[window	 makeKeyAndVisible];


}

- (void)setBarStyle:(UIBarStyle)style andTintColor:(UIColor *)color forNavigationBar:(UINavigationBar *)bar {
    bar.barStyle = style;
	bar.tintColor = color;	
}


// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
	if (tabBarController.selectedIndex == 0) {
		NSLog(@"Estou na um");
		[vcONE viewDidLoad];
	}
	else {
		if (tabBarController.selectedIndex == 1) {
			NSLog(@"Estou na dois");
			[vcONE viewDidUnload];
		}
		else {
			if (tabBarController.selectedIndex == 2) {
				NSLog(@"Estou na Tres");
			}
			else {
				if (tabBarController.selectedIndex ==3) {
					NSLog(@"Estou na quatro");
				}
			}

		}

	}

}

- (void)setTabOrderIfSaved {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *savedOrder = [defaults arrayForKey:@"savedTabOrder"];
	NSMutableArray *orderedTabs = [NSMutableArray arrayWithCapacity:6];
	
	if ([savedOrder count] > 0 ) {
		for (int i = 0; i < [savedOrder count]; i++){
			for (UIViewController *aController in tabBarController.viewControllers) {
				if ([aController.title isEqualToString:[savedOrder objectAtIndex:i]]) {
					[orderedTabs addObject:aController];
				}
			}
		}
		tabBarController.viewControllers = orderedTabs;
	}
}


- (void)applicationWillTerminate:(UIApplication *)application {
	
	NSMutableArray *savedOrder = [NSMutableArray arrayWithCapacity:6];
	NSArray *tabOrderToSave = tabBarController.viewControllers;
	for (UIViewController *aViewController in tabOrderToSave) {
		NSLog(@"%@",aViewController.title);
		[savedOrder addObject:aViewController.title];
	}
	
	[[NSUserDefaults standardUserDefaults] setObject:savedOrder forKey:@"savedTabOrder"];
}


// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}

- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

