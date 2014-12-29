// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMSubject.m instead.

#import "_JCMSubject.h"

const struct JCMSubjectAttributes JCMSubjectAttributes = {
	.subtitle = @"subtitle",
	.title = @"title",
};

const struct JCMSubjectRelationships JCMSubjectRelationships = {
	.category = @"category",
	.prophecies = @"prophecies",
	.references = @"references",
};

@implementation JCMSubjectID
@end

@implementation _JCMSubject

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"JCMSubject" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"JCMSubject";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"JCMSubject" inManagedObjectContext:moc_];
}

- (JCMSubjectID*)objectID {
	return (JCMSubjectID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic subtitle;

@dynamic title;

@dynamic category;

@dynamic prophecies;

- (NSMutableOrderedSet*)propheciesSet {
	[self willAccessValueForKey:@"prophecies"];

	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"prophecies"];

	[self didAccessValueForKey:@"prophecies"];
	return result;
}

@dynamic references;

- (NSMutableSet*)referencesSet {
	[self willAccessValueForKey:@"references"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"references"];

	[self didAccessValueForKey:@"references"];
	return result;
}

@end

@implementation _JCMSubject (PropheciesCoreDataGeneratedAccessors)
- (void)addProphecies:(NSOrderedSet*)value_ {
	[self.propheciesSet unionOrderedSet:value_];
}
- (void)removeProphecies:(NSOrderedSet*)value_ {
	[self.propheciesSet minusOrderedSet:value_];
}
- (void)addPropheciesObject:(JCMProphecy*)value_ {
	[self.propheciesSet addObject:value_];
}
- (void)removePropheciesObject:(JCMProphecy*)value_ {
	[self.propheciesSet removeObject:value_];
}
- (void)insertObject:(JCMProphecy*)value inPropheciesAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"prophecies"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self prophecies]];
    [tmpOrderedSet insertObject:value atIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"prophecies"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"prophecies"];
}
- (void)removeObjectFromPropheciesAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"prophecies"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self prophecies]];
    [tmpOrderedSet removeObjectAtIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"prophecies"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"prophecies"];
}
- (void)insertProphecies:(NSArray *)value atIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"prophecies"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self prophecies]];
    [tmpOrderedSet insertObjects:value atIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"prophecies"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"prophecies"];
}
- (void)removePropheciesAtIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"prophecies"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self prophecies]];
    [tmpOrderedSet removeObjectsAtIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"prophecies"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"prophecies"];
}
- (void)replaceObjectInPropheciesAtIndex:(NSUInteger)idx withObject:(JCMProphecy*)value {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"prophecies"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self prophecies]];
    [tmpOrderedSet replaceObjectAtIndex:idx withObject:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"prophecies"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"prophecies"];
}
- (void)replacePropheciesAtIndexes:(NSIndexSet *)indexes withProphecies:(NSArray *)value {
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"prophecies"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self prophecies]];
    [tmpOrderedSet replaceObjectsAtIndexes:indexes withObjects:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"prophecies"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"prophecies"];
}
@end

