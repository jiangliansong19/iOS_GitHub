//
//  DataBase.m
//  CoreData使用
//
//  Created by 江连松 on 2017/5/4.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "DataBase.h"
#import "MJExtension.h"

#import "Person+CoreDataProperties.h"

@implementation DataBase

+ (DataBase *)shareDataBase {
    static DataBase *obj = nil;
    if (obj == nil) {
        obj = [[DataBase alloc]init];
        
        
        //documet目录下
        NSString *doc  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [doc stringByAppendingPathComponent:@"/student.db"];//注意不是:stringByAppendingString
        
        NSURL *url = [NSURL fileURLWithPath:path];
        NSLog(@"-------data : %@",path);
        
        //创建文件,并且打开数据库文件
        NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        //给存储器指定存储的类型
        NSError *error;
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
        if (store == nil) {
            [NSException raise:@"添加数据库错误" format:@"%@",[error localizedDescription]];
        }
        
        //创建图形上下文
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        context.persistentStoreCoordinator = psc;
        obj.managedContext = context;
    }
    return obj;
}


//#pragma mark - Core Data stack
//
//@synthesize persistentContainer = _persistentContainer;
//
//- (NSPersistentContainer *)persistentContainer {
//    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
//    @synchronized (self) {
//        if (_persistentContainer == nil) {
//            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreData__"];
//            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
//                if (error != nil) {
//                    // Replace this implementation with code to handle the error appropriately.
//                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                    
//                    /*
//                     Typical reasons for an error here include:
//                     * The parent directory does not exist, cannot be created, or disallows writing.
//                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                     * The device is out of space.
//                     * The store could not be migrated to the current model version.
//                     Check the error message to determine what the actual problem was.
//                     */
//                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//                    abort();
//                }
//            }];
//        }
//    }
//    
//    return _persistentContainer;
//}
//
//#pragma mark - Core Data Saving support
//
//- (void)saveContext {
//    NSManagedObjectContext *context = self.persistentContainer.viewContext;
//    NSError *error = nil;
//    if ([context hasChanges] && ![context save:&error]) {
//        // Replace this implementation with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        abort();
//    }
//}


#pragma mark - 增

- (void)insertObject:(NSManagedObject *)obj {
    NSError *error = nil;
    [[DataBase shareDataBase].managedContext save:&error];
    if (error) [NSException raise:@"访问数据库错误" format:@"%@",[error localizedDescription]];
}

#pragma mark - 删

- (void)deleteObject:(NSManagedObject *)obj {
    [[DataBase shareDataBase].managedContext deleteObject:obj];
    NSError *error = nil;
    [[DataBase shareDataBase].managedContext save:&error];
    if (error) [NSException raise:@"删除数据失败" format:@"%@",[error localizedDescription]];
}

#pragma mark - 查所有的

- (NSMutableArray *)getAllObjects:(NSString *)name {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:name];
    NSError *error = nil;
    NSArray *objs = [self.managedContext executeFetchRequest:request error:&error];
    if (error) [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    return [NSMutableArray arrayWithArray:objs];
}

#pragma mark - 指定条件的查询

- (NSMutableArray *)searchObjcet:(NSString *)name predicate:(NSPredicate *)pre {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:name];
    request.predicate = pre;
    NSError *error = nil;
    NSArray *objs = [self.managedContext executeFetchRequest:request error:&error];
    if (error) [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    return [NSMutableArray arrayWithArray:objs];
}

#pragma mark - 改

- (void)modifyObject:(NSManagedObject *)obj changeContent:(NSDictionary *)dic {
    for(NSString *key in dic.allKeys) {
        [obj setValue:dic[key] forKey:key];
    }
    [self insertObject:obj];
}
@end
