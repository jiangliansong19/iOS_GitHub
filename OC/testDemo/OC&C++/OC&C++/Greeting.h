//
//  Greeting.h
//  OC&C++
//
//  Created by 江连松 on 2017/5/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hello.mm"

@interface Greeting : NSObject {
@private
    Hello *hello;
}
- (id)init;
- (void)sayGreeting;
- (void)sayGreeting:(Hello*)greeting;
@end
