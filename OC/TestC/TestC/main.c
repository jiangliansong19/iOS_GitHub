//
//  main.c
//  TestC
//
//  Created by 江连松 on 2019/8/9.
//  Copyright © 2019 jls. All rights reserved.
//

#include <stdio.h>

union Word {
    char s[10];
    double d;
    int n;
};

struct Student{
    char sex;
    int length;
    char name[10];
}__attribute__ ((aligned (1)));


int main(int argc, const char * argv[]) {
    // insert code here...

    struct Student stu;
    union Word w;
    
    int i = 10;
    int *p = &i;
    
    printf("%lu\n", sizeof(stu));
    printf("%lu\n", sizeof(w.d));
    printf("%lu\n", sizeof(*p));
    
    return 0;
}
