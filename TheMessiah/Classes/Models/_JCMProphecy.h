// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMProphecy.h instead.

@import CoreData;

extern const struct JCMProphecyRelationships {
	__unsafe_unretained NSString *subjects;
	__unsafe_unretained NSString *verses;
} JCMProphecyRelationships;

@class JCMSubject;
@class JCMVerse;

@interface JCMProphecyID : NSManagedObjectID {}
@end

@interface _JCMProphecy : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCMProphecyID* objectID;

@property (nonatomic, strong) NSSet *subjects;

- (NSMutableSet*)subjectsSet;

@property (nonatomic, strong) NSOrderedSet *verses;

- (NSMutableOrderedSet*)versesSet;

@end

@interface _JCMProphecy (SubjectsCoreDataGeneratedAccessors)
- (void)addSubjects:(NSSet*)value_;
- (void)removeSubjects:(NSSet*)value_;
- (void)addSubjectsObject:(JCMSubject*)value_;
- (void)removeSubjectsObject:(JCMSubject*)value_;

@end

@interface _JCMProphecy (VersesCoreDataGeneratedAccessors)
- (void)addVerses:(NSOrderedSet*)value_;
- (void)removeVerses:(NSOrderedSet*)value_;
- (void)addVersesObject:(JCMVerse*)value_;
- (void)removeVersesObject:(JCMVerse*)value_;

- (void)insertObject:(JCMVerse*)value inVersesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromVersesAtIndex:(NSUInteger)idx;
- (void)insertVerses:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeVersesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInVersesAtIndex:(NSUInteger)idx withObject:(JCMVerse*)value;
- (void)replaceVersesAtIndexes:(NSIndexSet *)indexes withVerses:(NSArray *)values;

@end

@interface _JCMProphecy (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet*)primitiveSubjects;
- (void)setPrimitiveSubjects:(NSMutableSet*)value;

- (NSMutableOrderedSet*)primitiveVerses;
- (void)setPrimitiveVerses:(NSMutableOrderedSet*)value;

@end
