// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KJVChapter.h instead.

@import CoreData;

extern const struct KJVChapterAttributes {
	__unsafe_unretained NSString *abbreviatedTitle;
	__unsafe_unretained NSString *title;
} KJVChapterAttributes;

extern const struct KJVChapterRelationships {
	__unsafe_unretained NSString *nextChapter;
	__unsafe_unretained NSString *previousChapter;
	__unsafe_unretained NSString *promises;
	__unsafe_unretained NSString *verses;
} KJVChapterRelationships;

@class KJVChapter;
@class KJVChapter;
@class JCMVerse;
@class KJVVerse;

@interface KJVChapterID : NSManagedObjectID {}
@end

@interface _KJVChapter : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) KJVChapterID* objectID;

@property (nonatomic, strong) NSString* abbreviatedTitle;

//- (BOOL)validateAbbreviatedTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) KJVChapter *nextChapter;

//- (BOOL)validateNextChapter:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) KJVChapter *previousChapter;

//- (BOOL)validatePreviousChapter:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *promises;

- (NSMutableSet*)promisesSet;

@property (nonatomic, strong) NSOrderedSet *verses;

- (NSMutableOrderedSet*)versesSet;

@end

@interface _KJVChapter (PromisesCoreDataGeneratedAccessors)
- (void)addPromises:(NSSet*)value_;
- (void)removePromises:(NSSet*)value_;
- (void)addPromisesObject:(JCMVerse*)value_;
- (void)removePromisesObject:(JCMVerse*)value_;

@end

@interface _KJVChapter (VersesCoreDataGeneratedAccessors)
- (void)addVerses:(NSOrderedSet*)value_;
- (void)removeVerses:(NSOrderedSet*)value_;
- (void)addVersesObject:(KJVVerse*)value_;
- (void)removeVersesObject:(KJVVerse*)value_;

- (void)insertObject:(KJVVerse*)value inVersesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromVersesAtIndex:(NSUInteger)idx;
- (void)insertVerses:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeVersesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInVersesAtIndex:(NSUInteger)idx withObject:(KJVVerse*)value;
- (void)replaceVersesAtIndexes:(NSIndexSet *)indexes withVerses:(NSArray *)values;

@end

@interface _KJVChapter (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAbbreviatedTitle;
- (void)setPrimitiveAbbreviatedTitle:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (KJVChapter*)primitiveNextChapter;
- (void)setPrimitiveNextChapter:(KJVChapter*)value;

- (KJVChapter*)primitivePreviousChapter;
- (void)setPrimitivePreviousChapter:(KJVChapter*)value;

- (NSMutableSet*)primitivePromises;
- (void)setPrimitivePromises:(NSMutableSet*)value;

- (NSMutableOrderedSet*)primitiveVerses;
- (void)setPrimitiveVerses:(NSMutableOrderedSet*)value;

@end
