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

    char *s = "hello world~~~";
    char *begin = s;
    for (int i = 0; i < strlen(s); i++) {
        begin++;
        printf("%p\n", begin);
    }
    return 0;
}
