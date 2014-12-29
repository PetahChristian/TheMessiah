// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMVerse.m instead.

#import "_JCMVerse.h"

const struct JCMVerseAttributes JCMVerseAttributes = {
	.book = @"book",
	.bookChapterVerse = @"bookChapterVerse",
	.reference = @"reference",
	.textESV = @"textESV",
	.textKJV = @"textKJV",
	.textNASB = @"textNASB",
};

const struct JCMVerseRelationships JCMVerseRelationships = {
	.chapter = @"chapter",
	.prophecies = @"prophecies",
};

@implementation JCMVerseID
@end

@implementation _JCMVerse

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"JCMVerse" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"JCMVerse";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"JCMVerse" inManagedObjectContext:moc_];
}

- (JCMVerseID*)objectID {
	return (JCMVerseID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"bookValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"book"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"bookChapterVerseValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"bookChapterVerse"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic book;

- (int16_t)bookValue {
	NSNumber *result = [self book];
	return [result shortValue];
}

- (void)setBookValue:(int16_t)value_ {
	[self setBook:@(value_)];
}

- (int16_t)primitiveBookValue {
	NSNumber *result = [self primitiveBook];
	return [result shortValue];
}

- (void)setPrimitiveBookValue:(int16_t)value_ {
	[self setPrimitiveBook:@(value_)];
}

@dynamic bookChapterVerse;

- (int32_t)bookChapterVerseValue {
	NSNumber *result = [self bookChapterVerse];
	return [result intValue];
}

- (void)setBookChapterVerseValue:(int32_t)value_ {
	[self setBookChapterVerse:@(value_)];
}

- (int32_t)primitiveBookChapterVerseValue {
	NSNumber *result = [self primitiveBookChapterVerse];
	return [result intValue];
}

- (void)setPrimitiveBookChapterVerseValue:(int32_t)value_ {
	[self setPrimitiveBookChapterVerse:@(value_)];
}

@dynamic reference;

@dynamic textESV;

@dynamic textKJV;

@dynamic textNASB;

@dynamic chapter;

@dynamic prophecies;

- (NSMutableSet*)propheciesSet {
	[self willAccessValueForKey:@"prophecies"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"prophecies"];

	[self didAccessValueForKey:@"prophecies"];
	return result;
}

@end

