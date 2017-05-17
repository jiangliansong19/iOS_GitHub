//
//  Person+CoreDataProperties.m
//  
//
//  Created by 江连松 on 2017/5/6.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic age;
@dynamic person_id;
@dynamic cars;

@end
