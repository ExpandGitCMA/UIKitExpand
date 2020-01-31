#import "FatalRadioManager.h"
#import <Photos/PHPhotoLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <CoreLocation/CoreLocation.h>
#import <Contacts/Contacts.h>
#import <AddressBook/AddressBook.h>
@import CoreTelephony;
#import <EventKit/EventKit.h>
#import <UIKit/UIKit.h>
@interface FatalRadioManager()
@property (strong, nonatomic) CLLocationManager *LocationManager;
@end
@implementation FatalRadioManager
- (void)applyOnOutwardAppendix:(ZFJCheckPermissionType)permissionType completed:(ZFJCheckResultType)completed{
    if(permissionType == ZFJCheckDataRestricted){
        CTCellularData *cellularData = [[CTCellularData alloc]init];
        CTCellularDataRestrictedState state = cellularData.restrictedState;
        if(state == kCTCellularDataRestricted){
            if(completed){
                completed(kCTCellularDataRestricted);
            }
        }else if (state == kCTCellularDataNotRestricted){
            if(completed){
                completed(kCTCellularDataNotRestricted);
            }
        }else if (state == kCTCellularDataRestrictedStateUnknown){
            if(completed){
                completed(kCTCellularDataRestrictedStateUnknown);
            }
        }
    }else if(permissionType == ZFJCheckPhotoLibrary){
        PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
        if (photoAuthorStatus == PHAuthorizationStatusDenied) {
            if(completed){
                completed(PHAuthorizationStatusDenied);
            }
        }else if (photoAuthorStatus == PHAuthorizationStatusRestricted){
            if(completed){
                completed(PHAuthorizationStatusRestricted);
            }
        }else if (photoAuthorStatus == PHAuthorizationStatusNotDetermined){
            if(completed){
                completed(PHAuthorizationStatusNotDetermined);
            }
        }else if (photoAuthorStatus == PHAuthorizationStatusAuthorized){
            if(completed){
                completed(PHAuthorizationStatusAuthorized);
            }
        }
    }else if (permissionType == ZFJCheckCamera){
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if(authStatus == AVAuthorizationStatusNotDetermined){
            if(completed){
                completed(AVAuthorizationStatusNotDetermined);
            }
        }else if (authStatus == AVAuthorizationStatusRestricted){
            if(completed){
                completed(AVAuthorizationStatusRestricted);
            }
        }else if (authStatus == AVAuthorizationStatusDenied){
            if(completed){
                completed(AVAuthorizationStatusDenied);
            }
        }else if (authStatus == AVAuthorizationStatusAuthorized){
            if(completed){
                completed(AVAuthorizationStatusAuthorized);
            }
        }
    }else if (permissionType == ZFJCheckLocation){
        CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
        if(authorizationStatus == kCLAuthorizationStatusNotDetermined){
            if(completed){
                completed(kCLAuthorizationStatusNotDetermined);
            }
        }else if(authorizationStatus == kCLAuthorizationStatusRestricted){
            if(completed){
                completed(kCLAuthorizationStatusRestricted);
            }
        }else if(authorizationStatus == kCLAuthorizationStatusAuthorizedAlways){
            if(completed){
                completed(kCLAuthorizationStatusAuthorizedAlways);
            }
        }else if(authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse){
            if(completed){
                completed(kCLAuthorizationStatusAuthorizedWhenInUse);
            }
        }else if(authorizationStatus == kCLAuthorizationStatusDenied){
            if(completed){
                completed(kCLAuthorizationStatusDenied);
            }
        }
    }else if (permissionType == ZFJCheckNotification){
        UIUserNotificationType types = [[UIApplication sharedApplication] currentUserNotificationSettings].types;
        if(types == UIUserNotificationTypeNone){
            if(completed){
                completed(UIUserNotificationTypeNone);
            }
        }else if (types == (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)){
            if(completed){
                completed(types);
            }
        }
    }else if (permissionType == ZFJCheckAudio){
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
        if(authStatus == AVAuthorizationStatusNotDetermined){
            if(completed){
                completed(AVAuthorizationStatusNotDetermined);
            }
        }else if (authStatus == AVAuthorizationStatusRestricted){
            if(completed){
                completed(AVAuthorizationStatusRestricted);
            }
        }else if (authStatus == AVAuthorizationStatusDenied){
            if(completed){
                completed(AVAuthorizationStatusDenied);
            }
        }else if (authStatus == AVAuthorizationStatusAuthorized){
            if(completed){
                completed(AVAuthorizationStatusAuthorized);
            }
        }
    }else if(permissionType == ZFJCheckAddressBook){
        if([[[UIDevice currentDevice]systemVersion] floatValue] >= 9.0){
            CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
            if(status == CNAuthorizationStatusAuthorized){
                if(completed){
                    completed(CNAuthorizationStatusAuthorized);
                }
            }else if(status == CNAuthorizationStatusDenied){
                if(completed){
                    completed(CNAuthorizationStatusDenied);
                }
            }else if(status == CNAuthorizationStatusRestricted){
                if(completed){
                    completed(CNAuthorizationStatusRestricted);
                }
            }else if(status == CNAuthorizationStatusNotDetermined){
                if(completed){
                    completed(CNAuthorizationStatusNotDetermined);
                }
            }
        }else{
            ABAuthorizationStatus ABstatus = ABAddressBookGetAuthorizationStatus();
            if(ABstatus == kABAuthorizationStatusAuthorized){
                if(completed){
                    completed(kABAuthorizationStatusAuthorized);
                }
            }else if(ABstatus == kABAuthorizationStatusDenied){
                if(completed){
                    completed(kABAuthorizationStatusDenied);
                }
            }else if(ABstatus == kABAuthorizationStatusNotDetermined){
                if(completed){
                    completed(kABAuthorizationStatusNotDetermined);
                }
            }else if(ABstatus == kABAuthorizationStatusRestricted){
                if(completed){
                    completed(kABAuthorizationStatusRestricted);
                }
            }
        }
    }else if (permissionType == ZFJCheckCalendars){
        EKAuthorizationStatus EKstatus = [EKEventStore  authorizationStatusForEntityType:EKEntityTypeEvent];
        switch (EKstatus) {
            case EKAuthorizationStatusAuthorized:
                if(completed){
                    completed(EKAuthorizationStatusAuthorized);
                }
                break;
            case EKAuthorizationStatusDenied:
                if(completed){
                    completed(EKAuthorizationStatusDenied);
                }
                break;
            case EKAuthorizationStatusNotDetermined:
                if(completed){
                    completed(EKAuthorizationStatusNotDetermined);
                }
                break;
            case EKAuthorizationStatusRestricted:
                if(completed){
                    completed(EKAuthorizationStatusRestricted);
                }
                break;
            default:
                break;
        }
    }else if (permissionType == ZFJCheckReminders){
        EKAuthorizationStatus EKstatus = [EKEventStore  authorizationStatusForEntityType:EKEntityTypeReminder];
        switch (EKstatus) {
            case EKAuthorizationStatusAuthorized:
                if(completed){
                    completed(EKAuthorizationStatusAuthorized);
                }
                break;
            case EKAuthorizationStatusDenied:
                if(completed){
                    completed(EKAuthorizationStatusDenied);
                }
                break;
            case EKAuthorizationStatusNotDetermined:
                if(completed){
                    completed(EKAuthorizationStatusNotDetermined);
                }
                break;
            case EKAuthorizationStatusRestricted:
                if(completed){
                    completed(EKAuthorizationStatusRestricted);
                }
                break;
            default:
                break;
        }
    }else{
    }
}
- (void)imprisonPistol:(ZFJCheckPermissionType)permissionType completed:(void(^)(BOOL isScu))completed{
    if(permissionType == ZFJCheckDataRestricted){
        [self feelAlongsideResponsibleLawyer];
    }else if (permissionType == ZFJCheckLocation){
        self.LocationManager = [[CLLocationManager alloc] init];
        [self.LocationManager requestAlwaysAuthorization];
        [self.LocationManager requestWhenInUseAuthorization];
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8) {
            [self.LocationManager requestWhenInUseAuthorization];
        }
        [self.LocationManager startUpdatingLocation];
    }else if (permissionType == ZFJCheckAddressBook){
        if([[[UIDevice currentDevice]systemVersion] floatValue] >= 9.0){
            CNContactStore *contactStore = [[CNContactStore alloc] init];
            [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if(completed){
                    completed(granted);
                }
            }];
        }else{
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
            ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
                if (granted) {
                    CFRelease(addressBook);
                }
                if(completed){
                    completed(granted);
                }
            });
        }
    }else if (permissionType == ZFJCheckCalendars){
        EKEventStore *store = [[EKEventStore alloc]init];
        [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
            if(completed){
                completed(granted);
            }
        }];
    }else if (permissionType == ZFJCheckReminders){
        EKEventStore *store = [[EKEventStore alloc]init];
        [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
            if(completed){
                completed(granted);
            }
        }];
    }else if (permissionType == ZFJCheckPhotoLibrary){
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            BOOL granted = status == PHAuthorizationStatusAuthorized ? YES : NO;
            if(completed){
                completed(granted);
            }
        }];
    }else if (permissionType == ZFJCheckAudio){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
            if(completed){
                completed(granted);
            }
        }];
    }else if (permissionType == ZFJCheckCamera){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if(completed){
                completed(granted);
            }
        }];
    }else if (permissionType == ZFJCheckNotification){
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    }
}
- (void)feelAlongsideResponsibleLawyer{
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }
}
- (void)definitelyStoutProportion:(NSString *)meg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:meg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self feelAlongsideResponsibleLawyer];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
    }];
    [alert addAction:action1];
    [alert addAction:action2];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alert animated:YES completion:nil];
}
@end
