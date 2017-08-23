//
//  AspectsAppDelegate.m
//  AspectsDemo
//
//  Created by Peter Steinberger on 03/05/14.
//  Copyright (c) 2014 PSPDFKit GmbH. All rights reserved.
//

#import "AspectsAppDelegate.h"
#import "AspectsViewController.h"
#import "Aspects.h"

@implementation AspectsAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AspectsViewController *aspectsController = [AspectsViewController new];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:aspectsController];
    [self.window makeKeyAndVisible];

    // Ignore hooks when we are testing.
    if (!NSClassFromString(@"XCTestCase")) {
        [aspectsController aspect_hookSelector:@selector(buttonPressed:) withOptions:0 usingBlock:^(id<AspectInfo> aspectInfo) {
            NSLog(@"Button was pressed by: %@", aspectInfo.arguments);

        } error:NULL];

        [aspectsController aspect_hookSelector:@selector(viewWillLayoutSubviews) withOptions:0 usingBlock:^{
            NSLog(@"Controller is layouting!");
        } error:NULL];
        AspectsConfigInstance.unFindMethodToAdd=YES;
    }

    NSError *error=nil;
    [aspectsController aspect_hookSelector:NSSelectorFromString(@"aaaa:bbbb:") withOptions:AspectPositionAfter usingBlock:^(id a,...) {
        NSMutableArray *objectsArr=[[NSMutableArray alloc] init];
        if (a)
        {
            va_list argsList;
            va_start(argsList, a);
            id arg;
            for (NSUInteger i=0; i<2; i++) {
                arg = va_arg(argsList, id);
                [objectsArr addObject:arg];
            }
            va_end(argsList);
        }

        NSLog(@"12345---%@",objectsArr);
    } error:&error];
    NSLog(@"%@",error);
    [aspectsController aspect_hookSelector:NSSelectorFromString(@"cccc:") withOptions:AspectPositionAfter usingBlock:^(id a,id c) {

        NSLog(@"12345---%@",c);
    } error:&error];

    NSLog(@"%@",error);
    return YES;
}

@end
