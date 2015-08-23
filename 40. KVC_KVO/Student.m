//
//  Student.m
//  8. NSDictionary
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Student.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@implementation Student
- (instancetype)initWithProperties
{
    self = [super init];
    if (self) {
        self.firstname=[self chooseFirstname];
        self.lastname=[self chooseLastname];
        self.helloPhrase=[self chooseHelloPhrase];
    }
    return self;
}
- (void) setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
- (NSString*) description {
    return [NSString stringWithFormat:@"%@",self.firstname];
}
-(NSString*) chooseFirstname {
    
    NSArray *manFirstnames=[NSArray arrayWithObjects:@"Liam",@"Noah",@"Ethan",@"Mason",
                           @"Logan",@"Lucas",@"Jackson",@"Aiden",@"Oliver", @"Jacob", @"Elijah",
                           @"Alexander",@"James",@"Benjamin",@"Luke",@"Jack",@"Daniel",
                           @"Michael",@"Gabriel", @"William", @"Henry", @"Carter", @"Owen",
                           @"Caleb", @"Wyatt", @"Matthew", @"Jayden", @"Ryan", @"Nathan",
                           @"Isaac", @"Andrew", @"Joshua", @"Connor", @"Eli", @"David",
                           @"Samuel", @"Dylan",@"Hunter", @"Sebastian", @"Anthony",nil];
    NSArray *womenFirstnames=[NSArray arrayWithObjects:
                              @"Emma",@"Olivia",@"Sophia",@"Ava",@"Isabella",@"Mia",
                              @"Charlotte",@"Amelia",@"Emily",@"Madison",@"Harper",
                              @"Abigail",@"Lily",@"Ella",@"Avery",@"Sofia",@"Chloe",
                              @"Evelyn",@"Ellie",@"Aria",@"Aubrey",@"Grace",
                              @"Hannah",@"Audrey",@"Zoe",@"Elizabeth",@"Zoey",
                              @"Nora",@"Scarlett",@"Addison",@"Mila",@"Layla",
                              @"Lillian",@"Lucy",@"Natalie",@"Brooklyn",@"Riley",
                              @"Penelope",@"Violet",@"Claire", nil];
    NSArray *manAndWomen=[NSArray arrayWithObjects:manFirstnames,womenFirstnames, nil];
    NSUInteger manOrWomen=arc4random_uniform(1);
    NSArray *manOrWomenArray=[manAndWomen objectAtIndex:manOrWomen];
    return [manOrWomenArray objectAtIndex:arc4random_uniform((int)[manOrWomenArray count])];
}

-(NSString*) chooseLastname {
    
    NSArray *lastnames=[NSArray arrayWithObjects: @"Tremblay",
                        @"Gagnon", @"Roy",@"Cote",
                        @"Bouchard", @"Gauthier",
                        @"Morin",@"Lavoie",
                        @"Fortin", @"Gagne",
                        @"Ouellet", @"Pelletier",
                        @"Belanger", @"Levesque",
                        @"Bergeron", @"Leblanc",
                        @"Paquette", @"Girard",
                        @"Simard", @"Boucher",
                        @"Caron", @"Beaulieu",
                        @"Cloutier", @"Dube",
                        @"Poirier", nil];

    return [lastnames objectAtIndex:arc4random_uniform((int)[lastnames count])];
}
-(NSString*) chooseHelloPhrase {
    
    NSArray *HelloPhrases=[NSArray arrayWithObjects: @"Hello",
                        @"How are you?", @"Hola",@"Hi", nil];
    int count=(int)[HelloPhrases count];
    int index=arc4random_uniform(count);
    //NSLog(@"count:%d index:%d",count,index);
    return [HelloPhrases objectAtIndex:index];
}
@end