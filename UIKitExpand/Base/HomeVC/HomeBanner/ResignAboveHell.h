#import <Foundation/Foundation.h>
@interface NSArray (ZeroSDCSafety)
- (id)SafetyObjectAtIndex:(NSUInteger)index;
@end
@interface NSMutableArray (ZeroSDCSafety)
- (BOOL)SafetyAddObject:(id)anObject;
- (BOOL)SafetyInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (BOOL)SafetyRemoveObject:(id)anObject;
- (BOOL)SafetyRemoveObjectAtIndex:(NSUInteger)index;
- (BOOL)SafetyReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end
@interface NSMutableDictionary (ZeroSDCSafety)
- (void)SafetySetObject:(id)anObject forKey:(id <NSCopying>)aKey;
@end
@interface NSCalendar(ZeroSDCSafety)
- (NSDate *)safeDateFromComponents:(NSDateComponents *)comps;
- (NSDateComponents *)safeComponents:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date;
@end
