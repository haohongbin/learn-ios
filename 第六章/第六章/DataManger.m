//
//  DataManger.m
//  第六章
//
//  Created by hhb on 2020/11/17.
//  Copyright © 2020 edz. All rights reserved.
//

#import "DataManger.h"
#import <FMDatabase.h>
#import <FMDatabaseQueue.h>

#define UserInfoFile [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/UserInfoFile.sqlite"]

@interface DataManger()

@property(nonatomic,strong)FMDatabase *db;

@property(nonatomic,strong)FMDatabaseQueue *dataBaseQueue;

@end

@implementation DataManger

+ (DataManger *)sharedInstance{
    static DataManger *dataManger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataManger = [[super allocWithZone:nil]init];
        dataManger.dataBaseQueue = [FMDatabaseQueue databaseQueueWithPath:UserInfoFile];
        dataManger.db = [[FMDatabase alloc]initWithPath:UserInfoFile];
        [dataManger.db open];
        [dataManger initTable];
        [dataManger.db close];
        
    });
    return dataManger;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [DataManger sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone{
    return [DataManger sharedInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return [DataManger sharedInstance];
}

#pragma mark-创建数据库表
- (void)initTable{
    [self.db executeUpdate:@"create table if not exists DataMangerTable(name text,age integer,height integer)"];
}

#pragma mark-插入数据
- (void)insertDataWithName:(NSString *)name age:(NSInteger)age height:(NSInteger)height{
    __weak typeof(self) weakSelf = self;
    [self.dataBaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        [weakSelf.db open];
        [weakSelf.db executeUpdate:@"insert into DataMangerTable(name,age,height) values(?,?,?)",name,[NSNumber numberWithInteger:age],[NSNumber numberWithInteger:height]];
        [weakSelf.db close];
    }];
}

#pragma mark-查询数据
- (NSInteger)queryDataWithName:(NSString *)name{
    __block NSInteger userAge = 0;
    __weak typeof(self) weakSelf = self;
    [self.dataBaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        [weakSelf.db open];
        FMResultSet *set = [db executeQuery:@"Select * From DataMangerTable where name=?",name];
        while ([set next]) {
            userAge = [set intForColumn:@"age"];
        }
        [weakSelf.db close];
    }];
    NSLog(@"userAge = %ld",(long)userAge);
    return userAge;
}
@end
