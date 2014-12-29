// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMReference.h instead.

@import CoreData;

extern const struct JCMReferenceAttributes {
	__unsafe_unretained NSString *reference;
} JCMReferenceAttributes;

extern const struct JCMReferenceRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *subject;
} JCMReferenceRelationships;

@class JCMBook;
@class JCMSubject;

@interface JCMReferenceID : NSManagedObjectID {}
@end

@interface _JCMReference : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCMReferenceID* objectID;

@property (nonatomic, strong) NSString* reference;

//- (BOOL)validateReference:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JCMBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JCMSubject *subject;

//- (BOOL)validateSubject:(id*)value_ error:(NSError**)error_;

@end

@interface _JCMReference (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveReference;
- (void)setPrimitiveReference:(NSString*)value;

- (JCMBook*)primitiveBook;
- (void)setPrimitiveBook:(JCMBook*)value;

- (JCMSubject*)primitiveSubject;
- (void)setPrimitiveSubject:(JCMSubject*)value;

@end
