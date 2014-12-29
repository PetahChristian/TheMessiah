// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KJVChapter.m instead.

#import "_KJVChapter.h"

const struct KJVChapterAttributes KJVChapterAttributes = {
	.abbreviatedTitle = @"abbreviatedTitle",
	.title = @"title",
};

const struct KJVChapterRelationships KJVChapterRelationships = {
	.nextChapter = @"nextChapter",
	.previousChapter = @"previousChapter",
	.promises = @"promises",
	.verses = @"verses",
};

@implementation KJVChapterID
@end

@implementation _KJVChapter

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"KJVChapter" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"KJVChapter";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"KJVChapter" inManagedObjectContext:moc_];
}

- (KJVChapterID*)objectID {
	return (KJVChapterID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic abbreviatedTitle;

@dynamic title;

@dynamic nextChapter;

@dynamic previousChapter;

@dynamic promises;

- (NSMutableSet*)promisesSet {
	[self willAccessValueForKey:@"promises"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"promises"];

	[self didAccessValueForKey:@"promises"];
	return result;
}

@dynamic verses;

- (NSMutableOrderedSet*)versesSet {
	[self willAccessValueForKey:@"verses"];

	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"verses"];

	[self didAccessValueForKey:@"verses"];
	return result;
}

@end

@implementation _KJVChapter (VersesCoreDataGeneratedAccessors)
- (void)addVerses:(NSOrderedSet*)value_ {
	[self.versesSet unionOrderedSet:value_];
}
- (void)removeVerses:(NSOrderedSet*)value_ {
	[self.versesSet minusOrderedSet:value_];
}
- (void)addVersesObject:(KJVVerse*)value_ {
	[self.versesSet addObject:value_];
}
- (void)removeVersesObject:(KJVVerse*)value_ {
	[self.versesSet removeObject:value_];
}
- (void)insertObject:(KJVVerse*)value inVersesAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"verses"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self verses]];
    [tmpOrderedSet insertObject:value atIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"verses"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"verses"];
}
- (void)removeObjectFromVersesAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"verses"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self verses]];
    [tmpOrderedSet removeObjectAtIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"verses"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"verses"];
}
- (void)insertVerses:(NSArray *)value atIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"verses"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self verses]];
    [tmpOrderedSet insertObjects:value atIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"verses"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"verses"];
}
- (void)removeVersesAtIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"verses"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self verses]];
    [tmpOrderedSet removeObjectsAtIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"verses"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"verses"];
}
- (void)replaceObjectInVersesAtIndex:(NSUInteger)idx withObject:(KJVVerse*)value {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"verses"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self verses]];
    [tmpOrderedSet replaceObjectAtIndex:idx withObject:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"verses"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"verses"];
}
- (void)replaceVersesAtIndexes:(NSIndexSet *)indexes withVerses:(NSArray *)value {
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"verses"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self verses]];
    [tmpOrderedSet replaceObjectsAtIndexes:indexes withObjects:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"verses"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"verses"];
}
@end

