// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KJVVerse.h instead.

@import CoreData;

extern const struct KJVVerseAttributes {
	__unsafe_unretained NSString *text;
} KJVVerseAttributes;

extern const struct KJVVerseRelationships {
	__unsafe_unretained NSString *chapter;
} KJVVerseRelationships;

@class KJVChapter;

@interface KJVVerseID : NSManagedObjectID {}
@end

@interface _KJVVerse : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) KJVVerseID* objectID;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) KJVChapter *chapter;

//- (BOOL)validateChapter:(id*)value_ error:(NSError**)error_;

@end

@interface _KJVVerse (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (KJVChapter*)primitiveChapter;
- (void)setPrimitiveChapter:(KJVChapter*)value;

@end
