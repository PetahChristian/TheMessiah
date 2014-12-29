// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KJVVerse.m instead.

#import "_KJVVerse.h"

const struct KJVVerseAttributes KJVVerseAttributes = {
	.text = @"text",
};

const struct KJVVerseRelationships KJVVerseRelationships = {
	.chapter = @"chapter",
};

@implementation KJVVerseID
@end

@implementation _KJVVerse

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"KJVVerse" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"KJVVerse";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"KJVVerse" inManagedObjectContext:moc_];
}

- (KJVVerseID*)objectID {
	return (KJVVerseID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic text;

@dynamic chapter;

@end

