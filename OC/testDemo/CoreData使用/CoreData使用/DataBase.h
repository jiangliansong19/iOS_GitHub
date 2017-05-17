//
//  DataBase.h
//  CoreData使用
//
//  Created by 江连松 on 2017/5/4.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DataBase : NSObject

+ (DataBase *)shareDataBase;
@property (nonatomic, strong) NSManagedObjectContext *managedContext;


//@property (readonly, strong) NSPersistentContainer *persistentContainer;
//
//- (void)saveContext;


- (NSMutableArray *)getAllObjects:(NSString *)className;


- (void)insertObject:(NSManagedObject *)obj;

- (void)deleteObject:(NSManagedObject *)obj;

- (NSMutableArray *)searchObjcet:(NSString *)className predicate:(NSPredicate *)pre;

- (void)modifyObject:(NSManagedObject *)obj changeContent:(NSDictionary *)dic;
@end
