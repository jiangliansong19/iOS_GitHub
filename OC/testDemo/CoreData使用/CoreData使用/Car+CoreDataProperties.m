//
//  Car+CoreDataProperties.m
//  
//
//  Created by 江连松 on 2017/5/6.
//
//

#import "Car+CoreDataProperties.h"

@implementation Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Car"];
}

@dynamic car_id;
@dynamic brand;
@dynamic price;
@dynamic owner;

@end
