// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMBook.m instead.

#import "_JCMBook.h"

const struct JCMBookAttributes JCMBookAttributes = {
	.numberOfProphecies = @"numberOfProphecies",
	.order = @"order",
	.subtitle = @"subtitle",
	.title = @"title",
};

const struct JCMBookRelationships JCMBookRelationships = {
	.references = @"references",
};

@implementation JCMBookID
@end

@implementation _JCMBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"JCMBook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"JCMBook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"JCMBook" inManagedObjectContext:moc_];
}

- (JCMBookID*)objectID {
	return (JCMBookID*)[super objectID];
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

@dynamic references;

- (NSMutableOrderedSet*)referencesSet {
	[self willAccessValueForKey:@"references"];

	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"references"];

	[self didAccessValueForKey:@"references"];
	return result;
}

@end

@implementation _JCMBook (ReferencesCoreDataGeneratedAccessors)
- (void)addReferences:(NSOrderedSet*)value_ {
	[self.referencesSet unionOrderedSet:value_];
}
- (void)removeReferences:(NSOrderedSet*)value_ {
	[self.referencesSet minusOrderedSet:value_];
}
- (void)addReferencesObject:(JCMReference*)value_ {
	[self.referencesSet addObject:value_];
}
- (void)removeReferencesObject:(JCMReference*)value_ {
	[self.referencesSet removeObject:value_];
}
- (void)insertObject:(JCMReference*)value inReferencesAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"references"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self references]];
    [tmpOrderedSet insertObject:value atIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"references"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"references"];
}
- (void)removeObjectFromReferencesAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"references"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self references]];
    [tmpOrderedSet removeObjectAtIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"references"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"references"];
}
- (void)insertReferences:(NSArray *)value atIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"references"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self references]];
    [tmpOrderedSet insertObjects:value atIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"references"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"references"];
}
- (void)removeReferencesAtIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"references"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self references]];
    [tmpOrderedSet removeObjectsAtIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"references"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"references"];
}
- (void)replaceObjectInReferencesAtIndex:(NSUInteger)idx withObject:(JCMReference*)value {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"references"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self references]];
    [tmpOrderedSet replaceObjectAtIndex:idx withObject:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"references"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"references"];
}
- (void)replaceReferencesAtIndexes:(NSIndexSet *)indexes withReferences:(NSArray *)value {
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"references"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self references]];
    [tmpOrderedSet replaceObjectsAtIndexes:indexes withObjects:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"references"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"references"];
}
@end

