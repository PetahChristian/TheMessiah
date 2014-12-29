//
//  AppDelegate.m
//  TheMessiah
//
//  Created by Peter Jensen on 11/3/14.
//  Copyright (c) 2014 Peter Christian Jensen.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "AppDelegate.h"

#import "DetailViewController.h"
#import "MasterViewController.h"

#import "Constants.h" // For user defaults preference keys

@interface AppDelegate () <UISplitViewControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation AppDelegate

@synthesize window = _window;

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

#pragma mark - Getters and setters

- (NSManagedObjectModel *)managedObjectModel
{
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TheMessiah" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }

    // Create the coordinator and store

    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[NSBundle mainBundle] URLForResource:@"TheMessiah" withExtension:@"sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:@{NSReadOnlyPersistentStoreOption : @YES,                                                                                                                            NSSQLitePragmasOption: @{ @"journal_mode" : @"DELETE"}}
                                                           error:&error])
    {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:[[NSBundle mainBundle] bundleIdentifier] code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator)
    {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - <UIApplicationDelegate>

- (BOOL)               application:(UIApplication *)__unused application
    willFinishLaunchingWithOptions:(NSDictionary *)__unused launchOptions
{
    // Override point for customization after application launch.
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    splitViewController.delegate = self;
    splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;

    UINavigationController *masterNavigationController = [splitViewController.viewControllers firstObject];
    MasterViewController *masterViewController = (MasterViewController *)masterNavigationController.topViewController;
    masterViewController.managedObjectContext = self.managedObjectContext;

    UINavigationController *detailNavigationController = [splitViewController.viewControllers lastObject];
    DetailViewController *detailViewController = (DetailViewController *)detailNavigationController.topViewController;
    detailViewController.managedObjectContext = self.managedObjectContext;
    detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;

    // Register default values for any user defaults that don't exist

    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kJCMBibleVersionKey:@"KJV",
                                                              kJCMProphecyGroupByKey:@(kJCMProphecyGroupByCategory)}];

    // Must set window restorationIdentifier to restore size classes to match saved
    // state.  This will allow saving the splitViewcontroller in one orientation and
    // restoring in another.
    self.window.restorationIdentifier = @"WindowID";

//#ifdef DEBUG
//    // Pinch gesture to force exit, for testing state restoration
//    UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc]
//                                            initWithTarget:self action:@selector(_exit)];
//    [self.window addGestureRecognizer:recognizer];
//#endif

    [self.window makeKeyAndVisible];

    return YES;
}

//#ifdef DEBUG
//- (void) _exit __attribute__ ((noreturn))
//{
//    NSLog(@"Exiting due to debugging gesture to force exit.");
//    exit(0);
//}
//#endif

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

    // Save any modified user defaults to disk

    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    BOOL restore = YES;

    // Compare the app's version number to the stored version number, to avoid
    // attempting to restore an older version's saved state.

    NSString *version = [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"];
    NSString *storedVersion = [coder decodeObjectForKey:UIApplicationStateRestorationBundleVersionKey];
    restore = [version isEqualToString:storedVersion];

    return restore;
}

#pragma mark - <UISplitViewControllerDelegate>

- (BOOL)splitViewController:(UISplitViewController *)__unused splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    BOOL isDetailItemNil = ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] subject] == nil));

    if (isDetailItemNil)
    {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    }
    else
    {
        return NO;
    }
}

- (UIViewController *)splitViewController:(UISplitViewController *)splitViewController separateSecondaryViewControllerFromPrimaryViewController:(UIViewController *)primaryViewController
{
    if ([primaryViewController isKindOfClass:[UINavigationController class]])
    {
        for (UIViewController *secondaryViewController in [(UINavigationController *)primaryViewController viewControllers])
        {
            if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]])
            {
                return secondaryViewController;
            }
        }
    }

    // No secondary view controller present

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *secondaryViewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailNavigationControllerID"];

    // Ensure back button is enabled

    UIViewController *topViewController = [secondaryViewController topViewController];
    topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    topViewController.navigationItem.leftItemsSupplementBackButton = YES;

    return secondaryViewController;
}

@end
