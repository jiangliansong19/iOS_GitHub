//
//  Car+CoreDataProperties.h
//  
//
//  Created by 江连松 on 2017/5/6.
//
//

#import "Car+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *car_id;
@property (nullable, nonatomic, copy) NSString *brand;
@property (nullable, nonatomic, copy) NSNumber *price;
@property (nullable, nonatomic, retain) Person *owner;

@end

NS_ASSUME_NONNULL_END
