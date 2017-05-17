//
//  Greeting.h
//  OC和C++混编
//
//  Created by 江连松 on 2017/5/10.
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
