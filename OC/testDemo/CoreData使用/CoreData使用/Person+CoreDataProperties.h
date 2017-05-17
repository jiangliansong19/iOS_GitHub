//
//  Person+CoreDataProperties.h
//  
//
//  Created by 江连松 on 2017/5/6.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDecimalNumber *age;
@property (nullable, nonatomic, copy) NSString *person_id;
@property (nullable, nonatomic, retain) Car *cars;

@end

NS_ASSUME_NONNULL_END
