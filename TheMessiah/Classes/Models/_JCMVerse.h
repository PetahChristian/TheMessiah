// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCMVerse.h instead.

@import CoreData;

extern const struct JCMVerseAttributes {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *bookChapterVerse;
	__unsafe_unretained NSString *reference;
	__unsafe_unretained NSString *textESV;
	__unsafe_unretained NSString *textKJV;
	__unsafe_unretained NSString *textNASB;
} JCMVerseAttributes;

extern const struct JCMVerseRelationships {
	__unsafe_unretained NSString *chapter;
	__unsafe_unretained NSString *prophecies;
} JCMVerseRelationships;

@class KJVChapter;
@class JCMProphecy;

@interface JCMVerseID : NSManagedObjectID {}
@end

@interface _JCMVerse : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCMVerseID* objectID;

@property (nonatomic, strong) NSNumber* book;

@property (atomic) int16_t bookValue;
- (int16_t)bookValue;
- (void)setBookValue:(int16_t)value_;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* bookChapterVerse;

@property (atomic) int32_t bookChapterVerseValue;
- (int32_t)bookChapterVerseValue;
- (void)setBookChapterVerseValue:(int32_t)value_;

//- (BOOL)validateBookChapterVerse:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* reference;

//- (BOOL)validateReference:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* textESV;

//- (BOOL)validateTextESV:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* textKJV;

//- (BOOL)validateTextKJV:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* textNASB;

//- (BOOL)validateTextNASB:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) KJVChapter *chapter;

//- (BOOL)validateChapter:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *prophecies;

- (NSMutableSet*)propheciesSet;

@end

@interface _JCMVerse (PropheciesCoreDataGeneratedAccessors)
- (void)addProphecies:(NSSet*)value_;
- (void)removeProphecies:(NSSet*)value_;
- (void)addPropheciesObject:(JCMProphecy*)value_;
- (void)removePropheciesObject:(JCMProphecy*)value_;

@end

@interface _JCMVerse (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveBook;
- (void)setPrimitiveBook:(NSNumber*)value;

- (int16_t)primitiveBookValue;
- (void)setPrimitiveBookValue:(int16_t)value_;

- (NSNumber*)primitiveBookChapterVerse;
- (void)setPrimitiveBookChapterVerse:(NSNumber*)value;

- (int32_t)primitiveBookChapterVerseValue;
- (void)setPrimitiveBookChapterVerseValue:(int32_t)value_;

- (NSString*)primitiveReference;
- (void)setPrimitiveReference:(NSString*)value;

- (NSString*)primitiveTextESV;
- (void)setPrimitiveTextESV:(NSString*)value;

- (NSString*)primitiveTextKJV;
- (void)setPrimitiveTextKJV:(NSString*)value;

- (NSString*)primitiveTextNASB;
- (void)setPrimitiveTextNASB:(NSString*)value;

- (KJVChapter*)primitiveChapter;
- (void)setPrimitiveChapter:(KJVChapter*)value;

- (NSMutableSet*)primitiveProphecies;
- (void)setPrimitiveProphecies:(NSMutableSet*)value;

@end
