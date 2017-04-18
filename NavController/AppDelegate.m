//
//  AppDelegate.m
//  NavController
//
//  Created by iOS-School-1 on 18.04.17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewControllerNext.h"
#import "ViewController.h"
#import "CustomPageVC.h"

@interface AppDelegate () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray<UIViewController *> *vclist;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*UITabBarController *tabBarController =[[UITabBarController alloc] init];
    tabBarController.view.backgroundColor = [UIColor blueColor];
    
    tabBarController.viewControllers = @[
                                         [ViewController new],
                                         [ViewControllerNext new]
                                         ];
    self.window.rootViewController = tabBarController;*/
    //do not ignore options, doesn't work w/o them
    CustomPageVC *pageVC = [[CustomPageVC alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                   navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                   options:@{UIPageViewControllerOptionSpineLocationKey:@(UIPageViewControllerSpineLocationMid)}];
    pageVC.view.frame = self.window.frame;
    pageVC.dataSource = self;
    pageVC.view.backgroundColor = [UIColor whiteColor];
    
    UIViewController *vc1 = [ViewController new];
    vc1.view.frame = self.window.frame;
    vc1.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc2 = [ViewControllerNext new];
    vc2.view.frame = self.window.frame;
    vc2.view.backgroundColor = [UIColor blueColor];
    
    self.vclist = @[vc1, vc2];
    [pageVC setViewControllers:self.vclist
                     direction:UIPageViewControllerNavigationDirectionForward animated:YES
                    completion:^(BOOL finished){
                        NSLog(@"finished");
                    }];
    self.window.rootViewController = pageVC;
    return YES;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [self.vclist indexOfObject:viewController];
    NSUInteger previousIndex = abs((currentIndex - 1) % self.vclist.count);
    return self.vclist[previousIndex];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [self.vclist indexOfObject:viewController];
    NSUInteger nextIndex = abs((currentIndex + 1) % self.vclist.count);
    return self.vclist[nextIndex];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
