#import <Foundation/Foundation.h>
@interface NSArray (Safety)
- (id)SafetyObjectAtIndex:(NSUInteger)index;
@end
@interface NSMutableArray (Safety)
- (BOOL)SafetyAddObject:(id)anObject;
- (BOOL)SafetyInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (BOOL)SafetyRemoveObject:(id)anObject;
- (BOOL)SafetyRemoveObjectAtIndex:(NSUInteger)index;
- (BOOL)SafetyReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end
@interface NSMutableDictionary (Safety)
- (void)SafetySetObject:(id)anObject forKey:(id <NSCopying>)aKey;
@end
@interface NSCalendar(Safety)
- (NSDate *)safeDateFromComponents:(NSDateComponents *)comps;
- (NSDateComponents *)safeComponents:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date;
@end
