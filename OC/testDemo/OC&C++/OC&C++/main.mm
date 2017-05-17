//
//  main.m
//  OC&C++
//
//  Created by 江连松 on 2017/5/10.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hello.mm"
#import "Greeting.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Greeting *greeting = [[Greeting alloc] init];
        [greeting sayGreeting];                         // > Hello,  world!
        
        Hello *hello = new Hello("Bonjour, monde!");
        [greeting sayGreeting:hello];                   // > Bonjour,  monde!
        
    }
    return 0;
}
