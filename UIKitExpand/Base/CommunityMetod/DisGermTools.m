#import "DisGermTools.h"
#import "DisBamboo.h"
#import <FMDB.h>
static DisGermTools * _DB = nil;
@interface DisGermTools ()<NSCopying,NSMutableCopying>
{
    FMDatabase * db;
}
@end
@implementation DisGermTools
+(instancetype)slidingDiaryShare{
    if (_DB == nil) {
        _DB = [[DisGermTools alloc] init];
        [_DB Initialize];
    }
    return _DB;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    if (_DB == nil) {
        _DB = [super allocWithZone:zone];
    }
    return _DB;
}
- (id)copy{
    return self;
}
- (id)mutableCopy{
    return self;
}
-(id)copyWithZone:(NSZone *)zone{
    return self;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return self;
}



- (void)Initialize{
    NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString * filePath = [documentsPath stringByAppendingPathComponent:@"NOTE_TABLE.sqlite"];
    db = [FMDatabase databaseWithPath:filePath];
     NSLog(@"成功filePath=%@", filePath);
    [db open];
    NSString * notesql = @"create table if not exists t_DIARY_TABLE(dataImageStr text,dataImageUrls text,dataImageUrl text,news text,token text,dateStr text,liker text,collect text,name text,headimageStr text);";
    [db executeUpdate:notesql];
    [db close];
}

-(void)deleteObjectByFormat:(DisBamboo *)noteModel{
    [db open];
    [db executeUpdate:@"DELETE FROM t_DIARY_TABLE WHERE token = ?",noteModel.token];
    [db close];
}


- (void)updateObjectsLiker:(DisBamboo *)model{
    
    [db open];
    BOOL flag = [db executeUpdate:@"UPDATE t_DIARY_TABLE SET liker = ?, collect = ? WHERE token = ?",model.liker,model.collect,model.token];
    NSLog(flag ? @"成功" : @"失败");
    [db close];

}




- (void)saveObjects:(NSMutableArray *)marrModel{
    for (NSInteger i = 0; i < marrModel.count; i++) {
        DisBamboo * model = marrModel[i];
        NSNumber * numID = [self maxIDWithTableStr:@"SELECT * FROM t_DIARY_TABLE" Column:@"token"];
       [db executeUpdate:@"INSERT INTO t_DIARY_TABLE(dataImageStr,dataImageUrls,dataImageUrl,news,token,dateStr,liker,collect,name,headimageStr)VALUES(?,?,?,?,?,?,?,?,?,?)",model.dataImageStr,model.dataImageUrls,model.dataImageUrl, model.news,numID,model.dateStr,model.liker,model.collect,model.name,model.headimageStr];
    }
    [db close];
}

- (NSMutableArray *)getAllDiaryMOdelArr{
    [db open];
    NSMutableArray * marr = [[NSMutableArray alloc] init];
    FMResultSet * result = [db executeQuery:@"SELECT * FROM t_DIARY_TABLE"];
    while ([result next]) {
        DisBamboo * Diarymodel = [[DisBamboo alloc] init];
        Diarymodel.dataImageStr = [result stringForColumn:@"dataImageStr"];
        
        Diarymodel.dataImageUrls = [result stringForColumn:@"dataImageUrls"];
        Diarymodel.dataImageUrl = [result stringForColumn:@"dataImageUrl"];
        Diarymodel.news = [result stringForColumn:@"news"];
        Diarymodel.dateStr = [result stringForColumn:@"dateStr"];
        Diarymodel.token = [result stringForColumn:@"token"];
        Diarymodel.liker = [result stringForColumn:@"liker"];
        Diarymodel.collect = [result stringForColumn:@"collect"];
        Diarymodel.name = [result stringForColumn:@"name"];
        Diarymodel.headimageStr = [result stringForColumn:@"headimageStr"];
        [marr addObject:Diarymodel];
    }
    [db close];
    return marr;
}
- (NSNumber *)maxIDWithTableStr:(NSString *)tableStr Column:(NSString *)column{
    [db open];
    NSNumber * ID = @(0);
    FMResultSet * result = [db executeQuery:tableStr];
    while ([result next]) {
        if ([ID integerValue] < [[result stringForColumn:column]integerValue]) {
            ID = @([[result stringForColumn:column]integerValue]);
        }
    }
    ID = @([ID integerValue]+1);
    return ID;
}
@end
