#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, ZFJCheckPermissionType){
  ZFJCheckDataRestricted = 0,
  ZFJCheckPhotoLibrary,
  ZFJCheckCamera,
  ZFJCheckLocation,
  ZFJCheckNotification,
  ZFJCheckAudio,
  ZFJCheckAddressBook,
  ZFJCheckCalendars,
  ZFJCheckReminders,
};
typedef void (^ZFJCheckResultType)( NSUInteger type);
@interface FatalRadioManager : NSObject
- (void)applyOnOutwardAppendix:(ZFJCheckPermissionType)permissionType completed:(ZFJCheckResultType)completed;
- (void)imprisonPistol:(ZFJCheckPermissionType)permissionType completed:(void(^)(BOOL isScu))completed;
- (void)feelAlongsideResponsibleLawyer;
- (void)definitelyStoutProportion:(NSString *)meg;
@end
