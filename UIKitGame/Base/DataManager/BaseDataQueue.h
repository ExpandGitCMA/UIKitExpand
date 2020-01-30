#import <Foundation/Foundation.h>
#import <FMDB.h>
NS_ASSUME_NONNULL_BEGIN
@interface BaseDataQueue : NSObject
@property(strong, nonatomic,readonly)FMDatabaseQueue *dataQueue;
+ (instancetype )shareInstance;
+ (void)insertDataToDataBase:(NSString *)tableName
                   primaryId:(NSString *)primaryId
                    userInfo:(NSDictionary *)userInfo
                  completion:(void(^)(BOOL success))completion;
+ (void)insertDatasDataBase:(NSString *)tableName
                  primaryId:(NSString *)primaryId
                   listData:(NSArray <NSDictionary *>*)listData
                 completion:(void(^)(BOOL success))completion;
+ (void)updateDataToDataBase:(NSString *)tableName
                   primaryId:(NSString *)primaryId
                    userInfo:(NSDictionary *)userInfo
                  completion:(void(^)(BOOL success))completion;
+ (void)deleteDataToDataBase:(NSString *)tableName
                   primaryId:(NSString *)primaryId
                primaryValue:(NSString *)primaryValue
                  completion:(void(^)(BOOL success))completion;
+ (void)deleteDatasToDataBase:(NSString *)tableName
                    primaryId:(NSString *)primaryId
                     listData:(NSArray <NSDictionary *>*)listData
                   completion:(void(^)(BOOL success))completion;
+ (void)getDataFromDataBase:(NSString *)tableName
                  primaryId:(NSString *)primaryId
               primaryValue:(NSString *)primaryValue
                 completion:(void(^)(NSDictionary *dictionary))completion;
+ (void)getDatasFromDataBase:(NSString *)tableName
                   primaryId:(NSString *)primaryId
                  completion:(void(^)(NSArray <NSDictionary *>*listData))completion;
+ (void)getDatasFromDataBase:(NSString *)tableName
                   primaryId:(NSString *)primaryId
                        page:(NSInteger)page
                    pageSize:(NSInteger)pageSize
                  completion:(void(^)(NSArray <NSDictionary *>*listData))completion;
+ (void)dropTableDataBase:(NSString *)tableName
               completion:(void (^)(BOOL))completion;
@end
NS_ASSUME_NONNULL_END
