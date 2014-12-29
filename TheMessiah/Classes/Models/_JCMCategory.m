// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMCategory.m instead.

#import "_JCMCategory.h"

const struct JCMCategoryAttributes JCMCategoryAttributes = {
	.numberOfProphecies = @"numberOfProphecies",
	.order = @"order",
	.subtitle = @"subtitle",
	.title = @"title",
};

const struct JCMCategoryRelationships JCMCategoryRelationships = {
	.subjects = @"subjects",
};

@implementation JCMCategoryID
@end

@implementation _JCMCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"JCMCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"JCMCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"JCMCategory" inManagedObjectContext:moc_];
}

- (JCMCategoryID*)objectID {
	return (JCMCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"numberOfPropheciesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"numberOfProphecies"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"orderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"order"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic numberOfProphecies;

- (int16_t)numberOfPropheciesValue {
	NSNumber *result = [self numberOfProphecies];
	return [result shortValue];
}

- (void)setNumberOfPropheciesValue:(int16_t)value_ {
	[self setNumberOfProphecies:@(value_)];
}

- (int16_t)primitiveNumberOfPropheciesValue {
	NSNumber *result = [self primitiveNumberOfProphecies];
	return [result shortValue];
}

- (void)setPrimitiveNumberOfPropheciesValue:(int16_t)value_ {
	[self setPrimitiveNumberOfProphecies:@(value_)];
}

@dynamic order;

- (int16_t)orderValue {
	NSNumber *result = [self order];
	return [result shortValue];
}

- (void)setOrderValue:(int16_t)value_ {
	[self setOrder:@(value_)];
}

- (int16_t)primitiveOrderValue {
	NSNumber *result = [self primitiveOrder];
	return [result shortValue];
}

- (void)setPrimitiveOrderValue:(int16_t)value_ {
	[self setPrimitiveOrder:@(value_)];
}

@dynamic subtitle;

@dynamic title;

@dynamic subjects;

- (NSMutableOrderedSet*)subjectsSet {
	[self willAccessValueForKey:@"subjects"];

	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"subjects"];

	[self didAccessValueForKey:@"subjects"];
	return result;
}

@end

@implementation _JCMCategory (SubjectsCoreDataGeneratedAccessors)
- (void)addSubjects:(NSOrderedSet*)value_ {
	[self.subjectsSet unionOrderedSet:value_];
}
- (void)removeSubjects:(NSOrderedSet*)value_ {
	[self.subjectsSet minusOrderedSet:value_];
}
- (void)addSubjectsObject:(JCMSubject*)value_ {
	[self.subjectsSet addObject:value_];
}
- (void)removeSubjectsObject:(JCMSubject*)value_ {
	[self.subjectsSet removeObject:value_];
}
- (void)insertObject:(JCMSubject*)value inSubjectsAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"subjects"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self subjects]];
    [tmpOrderedSet insertObject:value atIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"subjects"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"subjects"];
}
- (void)removeObjectFromSubjectsAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"subjects"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self subjects]];
    [tmpOrderedSet removeObjectAtIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"subjects"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"subjects"];
}
- (void)insertSubjects:(NSArray *)value atIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"subjects"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self subjects]];
    [tmpOrderedSet insertObjects:value atIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"subjects"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"subjects"];
}
- (void)removeSubjectsAtIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"subjects"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self subjects]];
    [tmpOrderedSet removeObjectsAtIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"subjects"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"subjects"];
}
- (void)replaceObjectInSubjectsAtIndex:(NSUInteger)idx withObject:(JCMSubject*)value {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"subjects"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self subjects]];
    [tmpOrderedSet replaceObjectAtIndex:idx withObject:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"subjects"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"subjects"];
}
- (void)replaceSubjectsAtIndexes:(NSIndexSet *)indexes withSubjects:(NSArray *)value {
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"subjects"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self subjects]];
    [tmpOrderedSet replaceObjectsAtIndexes:indexes withObjects:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"subjects"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"subjects"];
}
@end

