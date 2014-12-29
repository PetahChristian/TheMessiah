// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMSubject.h instead.

@import CoreData;

extern const struct JCMSubjectAttributes {
	__unsafe_unretained NSString *subtitle;
	__unsafe_unretained NSString *title;
} JCMSubjectAttributes;

extern const struct JCMSubjectRelationships {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *prophecies;
	__unsafe_unretained NSString *references;
} JCMSubjectRelationships;

@class JCMCategory;
@class JCMProphecy;
@class JCMReference;

@interface JCMSubjectID : NSManagedObjectID {}
@end

@interface _JCMSubject : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCMSubjectID* objectID;

@property (nonatomic, strong) NSString* subtitle;

//- (BOOL)validateSubtitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JCMCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSOrderedSet *prophecies;

- (NSMutableOrderedSet*)propheciesSet;

@property (nonatomic, strong) NSSet *references;

- (NSMutableSet*)referencesSet;

@end

@interface _JCMSubject (PropheciesCoreDataGeneratedAccessors)
- (void)addProphecies:(NSOrderedSet*)value_;
- (void)removeProphecies:(NSOrderedSet*)value_;
- (void)addPropheciesObject:(JCMProphecy*)value_;
- (void)removePropheciesObject:(JCMProphecy*)value_;

- (void)insertObject:(JCMProphecy*)value inPropheciesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPropheciesAtIndex:(NSUInteger)idx;
- (void)insertProphecies:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePropheciesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPropheciesAtIndex:(NSUInteger)idx withObject:(JCMProphecy*)value;
- (void)replacePropheciesAtIndexes:(NSIndexSet *)indexes withProphecies:(NSArray *)values;

@end

@interface _JCMSubject (ReferencesCoreDataGeneratedAccessors)
- (void)addReferences:(NSSet*)value_;
- (void)removeReferences:(NSSet*)value_;
- (void)addReferencesObject:(JCMReference*)value_;
- (void)removeReferencesObject:(JCMReference*)value_;

@end

@interface _JCMSubject (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveSubtitle;
- (void)setPrimitiveSubtitle:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (JCMCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(JCMCategory*)value;

- (NSMutableOrderedSet*)primitiveProphecies;
- (void)setPrimitiveProphecies:(NSMutableOrderedSet*)value;

- (NSMutableSet*)primitiveReferences;
- (void)setPrimitiveReferences:(NSMutableSet*)value;

@end
