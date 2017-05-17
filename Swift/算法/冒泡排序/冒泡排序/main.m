//
//  main.m
//  冒泡排序
//
//  Created by 江连松 on 2017/4/27.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int array[10] = {24, 17, 85, 13, 9, 54, 76, 45, 5, 63};
        int num = sizeof(array)/sizeof(int);
        for(int i = 0; i < num-1; i++) {
            for(int j = 0; j < num - 1 - i; j++) {
                if(array[j] < array[j+1]) {
                    int tmp = array[j];
                    array[j] = array[j+1];
                    array[j+1] = tmp;
                }
            }
        }
        
        for(int i = 0; i < num; i++) {
            printf("%d", array[i]);
            if(i == num-1) {
                printf("\n");
            }
            else {
                printf(" ");  
            }  
        }
    }
    return 0;
}
