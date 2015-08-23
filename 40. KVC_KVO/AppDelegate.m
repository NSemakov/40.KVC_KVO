//
//  AppDelegate.m
//  40. KVC_KVO
//
//  Created by Admin on 23.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "NVStudent.h"
@interface AppDelegate ()
@property (strong,nonatomic) NSMutableArray* arrayOfStudents;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*
    
    Student* student1=[[Student alloc]initWithProperties];
    Student* student2=[[Student alloc]initWithProperties];
    Student* student3=[[Student alloc]initWithProperties];
    Student* student4=[[Student alloc]initWithProperties];
    Student* student5=[[Student alloc]initWithProperties];
    
    student1.friendOfStudent=student2;
    student2.friendOfStudent=student3;
    student3.friendOfStudent=student4;
    student4.friendOfStudent=student5;
    self.arrayOfStudents=[NSArray arrayWithObjects:student1,student2,student3,student4,student5, nil];
    NSLog(@"%@",self.arrayOfStudents);
    [student4 addObserver:self forKeyPath:@"firstname" options:NSKeyValueObservingOptionNew|    NSKeyValueObservingOptionOld  context:nil];
    
    [student1 setValue:@"Alex" forKeyPath:@"firstname"];
    NSLog(@"%@",self.arrayOfStudents);
    [student1 setValue:@"Alex" forKeyPath:@"friendOfStudent.firstname"];
    NSLog(@"%@",self.arrayOfStudents);
    [student1 setValue:@"Alex" forKeyPath:@"friendOfStudent.friendOfStudent.firstname"];
    NSLog(@"%@",self.arrayOfStudents);
    [student1 setValue:@"Alex" forKeyPath:@"friendOfStudent.friendOfStudent.friendOfStudent.firstname"];
    NSLog(@"%@",self.arrayOfStudents);
    [student1 setValue:@"Alex" forKeyPath:@"friendOfStudent.friendOfStudent.friendOfStudent.friendOfStudent.firstname"];
    NSLog(@"%@",self.arrayOfStudents);
    //[student1 setValue:@"Alex" forKeyPath:@"name"];
    
    */
    self.arrayOfStudents=[NSMutableArray new];
    for (NSInteger i=0; i<30; i++) {
        NVStudent* student=[[NVStudent alloc]initWithProperties];
        [self.arrayOfStudents addObject:student];
    }
    NSArray* arrayOfNames=[self.arrayOfStudents valueForKeyPath:@"@unionOfObjects.firstname"];
    NSLog(@"all names: %@",arrayOfNames);
    //min year
    NSDate* date=[self.arrayOfStudents valueForKeyPath:@"@min.dateOfBirth"];
    NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    NSLog(@"min: %@",[formatter stringFromDate:date]);
    //max year
    date=[self.arrayOfStudents valueForKeyPath:@"@max.dateOfBirth"];
    NSLog(@"max: %@",[formatter stringFromDate:date]);
    //sum of months of birth of all students
    NSNumber* sumOfMonths=(NSNumber*)[self.arrayOfStudents valueForKeyPath:@"@sum.monthOfBirth"];
    NSLog(@"sum: %@",sumOfMonths);
    //avg of months of birth of all students
    NSNumber* avgOfMonths=(NSNumber*)[self.arrayOfStudents valueForKeyPath:@"@avg.monthOfBirth"];
    NSLog(@"avg: %@",avgOfMonths);

    return YES;
}
- (void) dealloc {
   // [self removeObserver:<#(NSObject *)#> forKeyPath:<#(NSString *)#>]
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"firstname"]) {
        NSLog(@"%@",change);
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
