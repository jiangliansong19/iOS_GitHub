//
//  main.cpp
//  C++
//
//  Created by 江连松 on 2019/8/9.
//  Copyright © 2019 jls. All rights reserved.
//

#include <iostream>

union Word {
    char s[10];
    int n : 2;
    double d;
};

struct Student{
    char sex;
    int length;
    char name[10];
};
　　

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    

    return 0;
}
