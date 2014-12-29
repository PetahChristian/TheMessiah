// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMBook.h instead.

@import CoreData;

extern const struct JCMBookAttributes {
	__unsafe_unretained NSString *numberOfProphecies;
	__unsafe_unretained NSString *order;
	__unsafe_unretained NSString *subtitle;
	__unsafe_unretained NSString *title;
} JCMBookAttributes;

extern const struct JCMBookRelationships {
	__unsafe_unretained NSString *references;
} JCMBookRelationships;

@class JCMReference;

@interface JCMBookID : NSManagedObjectID {}
@end

@interface _JCMBook : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCMBookID* objectID;

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

@property (nonatomic, strong) NSOrderedSet *references;

- (NSMutableOrderedSet*)referencesSet;

@end

@interface _JCMBook (ReferencesCoreDataGeneratedAccessors)
- (void)addReferences:(NSOrderedSet*)value_;
- (void)removeReferences:(NSOrderedSet*)value_;
- (void)addReferencesObject:(JCMReference*)value_;
- (void)removeReferencesObject:(JCMReference*)value_;

- (void)insertObject:(JCMReference*)value inReferencesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromReferencesAtIndex:(NSUInteger)idx;
- (void)insertReferences:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeReferencesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInReferencesAtIndex:(NSUInteger)idx withObject:(JCMReference*)value;
- (void)replaceReferencesAtIndexes:(NSIndexSet *)indexes withReferences:(NSArray *)values;

@end

@interface _JCMBook (CoreDataGeneratedPrimitiveAccessors)

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

- (NSMutableOrderedSet*)primitiveReferences;
- (void)setPrimitiveReferences:(NSMutableOrderedSet*)value;

@end
