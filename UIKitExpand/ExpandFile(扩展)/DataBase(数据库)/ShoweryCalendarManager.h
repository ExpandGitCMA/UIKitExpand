#import <Foundation/Foundation.h>
#import "AcademicFinding.h"
@interface ShoweryCalendarManager : NSObject
@property (nonatomic,readonly) AcademicFinding *user;
+(instancetype)sharedDefaultManager;
- (void)glideWithinWrongLeak:(AcademicFinding *)user;
- (void)searchBruise;
@end
