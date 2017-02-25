//
//  Object.h
//  OC中的C语言封装
//
//  Created by JLS on 2017/1/9.
//  Copyright © 2017年 JLS. All rights reserved.
//



// 定义Object对象
typedef struct Object {
    int retainCount;
}Object;

//宏定义方法 方便书写
#define OBJECTRETAIN(obj) objectRetain((Object*)obj)
#define OBJECTRELEASE(obj) objectRelease((Object*)obj)
#define GETRETAINCOUNT(obj) getRetainCount((Object*)obj)
void objectRetain(Object *obj);
void objectRelease(Object *obj);
int getRetainCount(Object *obj);
