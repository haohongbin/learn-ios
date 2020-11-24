//
//  Father.m
//  oc-super关键字
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Father.h"

@implementation Father
- (void)test{
    NSLog(@"father的test");
    
    NSLog(@"\n%@\n%@\n%@\n%@",[self class],[self superclass],[super class],[super superclass]);

}
@end
