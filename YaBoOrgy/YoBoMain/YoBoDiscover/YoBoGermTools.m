#import "YoBoGermTools.h"
#import "YoBoDisModel.h"
#import <FMDB.h>
static YoBoGermTools * _DB = nil;
@interface YoBoGermTools ()<NSCopying,NSMutableCopying>
{
    FMDatabase * db;
}
@end
@implementation YoBoGermTools
+(instancetype)toolsShareManer{
    if (_DB == nil) {
        _DB = [[YoBoGermTools alloc] init];
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
    NSString * notesql = @"create table if not exists t_DIARY_TABLE(imageStr text,imageUrls text,imageUrl text,news text,token text,timer text,liker text,collect text,name text,headimage text);";
    [db executeUpdate:notesql];
    [db close];
}

-(void)deleteObject:(YoBoDisModel *)model{
    [db open];
    [db executeUpdate:@"DELETE FROM t_DIARY_TABLE WHERE token = ?",model.token];
    [db close];
}


- (void)updateObjectsLiker:(YoBoDisModel *)model{
    
    [db open];
    BOOL flag = [db executeUpdate:@"UPDATE t_DIARY_TABLE SET liker = ?, collect = ? WHERE token = ?",model.liker,model.collect,model.token];
    NSLog(flag ? @"成功" : @"失败");
    [db close];

}

- (void)saveObjects:(NSMutableArray *)ObjectsModel{
    for (NSInteger i = 0; i < ObjectsModel.count; i++) {
        YoBoDisModel * model = ObjectsModel[i];
        NSNumber * numID = [self  insertTableWithID:@"SELECT * FROM t_DIARY_TABLE" Column:@"token"];
       [db executeUpdate:@"INSERT INTO t_DIARY_TABLE(imageStr,imageUrls,imageUrl,news,token,timer,liker,collect,name,headimage)VALUES(?,?,?,?,?,?,?,?,?,?)",model.imageStr,model.imageUrls,model.imageUrl, model.news,numID,model.timer,model.liker,model.collect,model.name,model.headimage];
    }
    [db close];
}


- (NSMutableArray *)getToolsOdelArr{
    [db open];
    NSMutableArray * marr = [[NSMutableArray alloc] init];
    FMResultSet * result = [db executeQuery:@"SELECT * FROM t_DIARY_TABLE"];
    while ([result next]) {
        YoBoDisModel *model = [[YoBoDisModel alloc] init];
           model.imageStr = [result stringForColumn:@"imageStr"];
           model.imageUrls = [result stringForColumn:@"imageUrls"];
           model.imageUrl = [result stringForColumn:@"imageUrl"];
           model.news = [result stringForColumn:@"news"];
           model.timer = [result stringForColumn:@"timer"];
           model.token = [result stringForColumn:@"token"];
           model.liker = [result stringForColumn:@"liker"];
           model.collect = [result stringForColumn:@"collect"];
           model.name = [result stringForColumn:@"name"];
           model.headimage = [result stringForColumn:@"headimage"];
        [marr addObject:model];
    }
    [db close];
    return marr;
}

- (NSNumber *) insertTableWithID:(NSString *)tableStr Column:(NSString *)column{
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
