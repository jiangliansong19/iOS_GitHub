//
//  Hello.cpp
//  OC&C++
//
//  Created by 江连松 on 2017/5/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#include <stdio.h>
#import <Foundation/Foundation.h>

class Hello {
private:
    id greeting_text;  // holds an NSString
public:
    Hello() {
        greeting_text = @"Hello, world!";
    }
    Hello(const char* initial_greeting_text) {
        greeting_text = [[NSString alloc] initWithUTF8String:initial_greeting_text];
    }
    void say_hello() {
        printf("%s\n", [greeting_text UTF8String]);
    }
};
