//
//  Student.h
//  8. NSDictionary
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (strong,nonatomic) NSString* firstname;
@property (strong,nonatomic) NSString* lastname;
@property (strong,nonatomic) NSString *helloPhrase;
@property (strong,nonatomic) Student* friendOfStudent;
- (instancetype)initWithProperties;
@end
