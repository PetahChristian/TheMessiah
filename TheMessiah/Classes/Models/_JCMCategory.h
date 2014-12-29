// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMCategory.h instead.

@import CoreData;

extern const struct JCMCategoryAttributes {
	__unsafe_unretained NSString *numberOfProphecies;
	__unsafe_unretained NSString *order;
	__unsafe_unretained NSString *subtitle;
	__unsafe_unretained NSString *title;
} JCMCategoryAttributes;

extern const struct JCMCategoryRelationships {
	__unsafe_unretained NSString *subjects;
} JCMCategoryRelationships;

@class JCMSubject;

@interface JCMCategoryID : NSManagedObjectID {}
@end

@interface _JCMCategory : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCMCategoryID* objectID;

@property (nonatomic, strong) NSNumber* numberOfProphecies;

@property (atomic) int16_t numberOfPropheciesValue;
- (int16_t)numberOfPropheciesValue;
- (void)setNumberOfPropheciesValue:(int16_t)value_;

//- (BOOL)validateNumberOfProphecies:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* order;

@property (atomic) int16_t orderValue;
- (int16_t)orderValue;
- (void)setOrderValue:(int16_t)value_;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* subtitle;

//- (BOOL)validateSubtitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSOrderedSet *subjects;

- (NSMutableOrderedSet*)subjectsSet;

@end

@interface _JCMCategory (SubjectsCoreDataGeneratedAccessors)
- (void)addSubjects:(NSOrderedSet*)value_;
- (void)removeSubjects:(NSOrderedSet*)value_;
- (void)addSubjectsObject:(JCMSubject*)value_;
- (void)removeSubjectsObject:(JCMSubject*)value_;

- (void)insertObject:(JCMSubject*)value inSubjectsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromSubjectsAtIndex:(NSUInteger)idx;
- (void)insertSubjects:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeSubjectsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInSubjectsAtIndex:(NSUInteger)idx withObject:(JCMSubject*)value;
- (void)replaceSubjectsAtIndexes:(NSIndexSet *)indexes withSubjects:(NSArray *)values;

@end

@interface _JCMCategory (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveNumberOfProphecies;
- (void)setPrimitiveNumberOfProphecies:(NSNumber*)value;

- (int16_t)primitiveNumberOfPropheciesValue;
- (void)setPrimitiveNumberOfPropheciesValue:(int16_t)value_;

- (NSNumber*)primitiveOrder;
- (void)setPrimitiveOrder:(NSNumber*)value;

- (int16_t)primitiveOrderValue;
- (void)setPrimitiveOrderValue:(int16_t)value_;

- (NSString*)primitiveSubtitle;
- (void)setPrimitiveSubtitle:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableOrderedSet*)primitiveSubjects;
- (void)setPrimitiveSubjects:(NSMutableOrderedSet*)value;

@end
