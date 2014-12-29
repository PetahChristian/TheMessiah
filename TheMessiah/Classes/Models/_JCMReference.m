// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMReference.m instead.

#import "_JCMReference.h"

const struct JCMReferenceAttributes JCMReferenceAttributes = {
	.reference = @"reference",
};

const struct JCMReferenceRelationships JCMReferenceRelationships = {
	.book = @"book",
	.subject = @"subject",
};

@implementation JCMReferenceID
@end

@implementation _JCMReference

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"JCMReference" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"JCMReference";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"JCMReference" inManagedObjectContext:moc_];
}

- (JCMReferenceID*)objectID {
	return (JCMReferenceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic reference;

@dynamic book;

@dynamic subject;

@end

