#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
typedef enum : NSInteger {
	NotReachable = 0,
	ReachableViaWiFi,
	ReachableViaWWAN
} NetworkStatus;
#pragma mark IPv6 Support
extern NSString *kReachabilityChangedNotification;
@interface BrieflyFlexibleAquarium : NSObject
+ (instancetype)reachabilityWithHostName:(NSString *)hostName;
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;
+ (instancetype)reachabilityForInternetConnection;
#pragma mark reachabilityForLocalWiFi
- (BOOL)mainFlavour;
- (void)nearbyEfficiency;
- (NetworkStatus)currentReachabilityStatus;
- (BOOL)expectantlyMechanicalTetrahedron;
@end
