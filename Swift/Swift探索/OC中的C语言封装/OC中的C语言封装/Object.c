//
//  Object.c
//  OC中的C语言封装
//
//  Created by JLS on 2017/1/9.
//  Copyright © 2017年 JLS. All rights reserved.
//

#include "Object.h"
#include <stdlib.h>


void objectRetain(Object *obj) {
    obj -> retainCount += 1;
}

void objectRelease(Object *obj) {
    obj -> retainCount -= 1;
    if (obj -> retainCount <= 0) {
        free(obj);
    }
}

int getRetainCount(Object *obj) {
    return obj -> retainCount;
}
