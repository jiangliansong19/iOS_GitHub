//
//  Hello.cpp
//  OC和C++混编
//
//  Created by 江连松 on 2017/5/10.
//  Copyright © 2017年 JLS. All rights reserved.
//

#include <stdio.h>
#include <Foundation/Foundation.h>


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
