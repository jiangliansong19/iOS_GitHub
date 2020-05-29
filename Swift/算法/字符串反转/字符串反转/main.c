//
//  main.c
//  字符串反转
//
//  Created by 江连松 on 2020/5/10.
//  Copyright © 2020 jls. All rights reserved.
//

#include <stdio.h>

void Flip(char*array,int len) {
    int left = 0;
    int right = len;
    while (left <= right) {
        char tmp = array[left];//数组内容进行翻转
        array[left] = array[right];
        array[right] = tmp;
        left++;//对循环条件进行调整
        right--;//对循环条件进行调整
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    char array[] = "tneduts a ma i";
    size_t len = strlen(array)-1;
    Flip(array, (int)len);
    for (int i = 0; i <= len; ++i) {
        printf("%c", array[i]);
    }
    printf("\n");
    return 0;

    
    return 0;
}
