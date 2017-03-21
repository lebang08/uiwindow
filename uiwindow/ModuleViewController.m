//
//  ModuleViewController.m
//  uiwindow
//
//  Created by apple on 2017/3/19.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "ModuleViewController.h"
#import "sqlite3.h"

@interface ModuleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *moduleName;
@property (weak, nonatomic) IBOutlet UITextField *edtPracticed;

@property (copy,nonatomic) NSString *databaseFilePath;
#define kDatabaseName @"database.sqlite3"

- (IBAction)doCommit:(id)sender;
- (IBAction)insert:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)delete:(id)sender;
- (IBAction)query:(id)sender;

@end

@implementation ModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.moduleName.text = self.name;
    
    //获取数据库路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.databaseFilePath = [documentsDirectory stringByAppendingPathComponent:kDatabaseName];
    //打开或创建数据库
    sqlite3 *database;
    if (sqlite3_open([self.databaseFilePath UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSLog(@"打开数据库失败");
        return;
    }
    //创建数据表
    NSString *sql_create = @"CREATE TABLE IF NOT EXISTS TABLE_LEBANG(NAME TEXT, SEX TEXT);";
    char *errorMsg;
    if (sqlite3_exec(database, [sql_create UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(database);
        NSLog(@"数据库建表失败");
        return;
    }
    
    sqlite3_stmt *stmt;
    char *sql_insert = "INSERT INTO TABLE_LEBANG(NAME,SEX)VALUES(?,?);";
    if (sqlite3_prepare_v2(database, sql_insert, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, [self.edtPracticed.text UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [self.moduleName.text UTF8String], -1, NULL);
    }else{
        sqlite3_close(database);
        NSLog(@"数据库准备插入失败");
        return;
    }
    
    if (sqlite3_step(stmt) != SQLITE_DONE) {
        sqlite3_finalize(stmt);
        NSLog(@"数据库插入失败");
    }
    
    
    //查询
    NSString *sql_query = @"SELECT NAME,SEX FROM TABLE_LEBANG";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [sql_query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name = (char *)sqlite3_column_text(statement, 0);
            char *sex = (char *)sqlite3_column_text(statement, 1);
            NSLog(@"数据库查出name %s |||sex %s",name,sex);
        }
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(database);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)doCommit:(id)sender {
    NSLog(@"done something 1");
    self.name = self.edtPracticed.text;
    if ([self.mDelegate respondsToSelector:@selector(setString:)]) {
        [self.mDelegate setString:self.name];
        NSLog(@"done something 2");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"done something 3");
}

- (IBAction)insert:(id)sender {
    sqlite3 *database;
    if(sqlite3_open([self.databaseFilePath UTF8String], &database) != SQLITE_OK){
        NSLog(@"open fail in isert method");
        sqlite3_close(database);
        return;
    }
    //插入
    sqlite3_stmt *stmt;
    char *sql_insert = "INSERT INTO TABLE_LEBANG(NAME,SEX)VALUES(?,?);";
    if (sqlite3_prepare_v2(database, sql_insert, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, [self.edtPracticed.text UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [self.moduleName.text UTF8String], -1, NULL);
    }else{
        sqlite3_close(database);
        NSLog(@"数据库准备插入失败");
        return;
    }
    
    if (sqlite3_step(stmt) != SQLITE_DONE) {
        sqlite3_finalize(stmt);
        NSLog(@"数据库插入失败");
    }
    sqlite3_close(database);
}

- (IBAction)update:(id)sender {
    sqlite3 *database;
    if(sqlite3_open([self.databaseFilePath UTF8String], &database) != SQLITE_OK){
        NSLog(@"open fail in update method");
        sqlite3_close(database);
        return;
    }
    //更新
    sqlite3_stmt *stmt;
    NSString *sql_update = @"UPDATE TABLE_LEBANG(NAME)VALUES(\"bbb\") WHERE SEX = 3;";
    if(sqlite3_exec(database, [sql_update UTF8String], NULL, NULL, NULL) !=SQLITE_OK){
        NSLog(@"数据库准备更新失败");
    };
    //    if (sqlite3_prepare_v2(database, sql_update, -1, &stmt, nil) == SQLITE_OK) {
    //        sqlite3_bind_text(stmt, 1, [self.edtPracticed.text UTF8String], -1, NULL);
    //    }else{
    //        sqlite3_close(database);
    //        NSLog(@"数据库准备更新失败");
    //        return;
    //    }
    //    if (sqlite3_step(stmt) != SQLITE_DONE) {
    //        sqlite3_finalize(stmt);
    //        NSLog(@"数据库更新失败");
    //    }
    sqlite3_close(database);
}

- (IBAction)delete:(id)sender {
    sqlite3 *database;
    if(sqlite3_open([self.databaseFilePath UTF8String], &database) != SQLITE_OK){
        NSLog(@"open fail in delete method");
        sqlite3_close(database);
        return;
    }
    //删除
    sqlite3_stmt *stmt;
    char *sql_delete = "DELETE FROM TABLE_LEBANG WHERE NAME = ?;";
    if (sqlite3_prepare_v2(database, sql_delete, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, [self.edtPracticed.text UTF8String], -1, NULL);
    }else{
        sqlite3_close(database);
        NSLog(@"数据库准备删除失败");
        return;
    }
    if (sqlite3_step(stmt) != SQLITE_DONE) {
        sqlite3_finalize(stmt);
        NSLog(@"数据库删除失败");
    }
    sqlite3_close(database);
}

- (IBAction)query:(id)sender {
    sqlite3 *database;
    if(sqlite3_open([self.databaseFilePath UTF8String], &database) != SQLITE_OK){
        NSLog(@"open fail in query method");
        sqlite3_close(database);
        return;
    }
    //查询
    NSString *sql_query = @"SELECT NAME,SEX FROM TABLE_LEBANG";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [sql_query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name = (char *)sqlite3_column_text(statement, 0);
            char *sex = (char *)sqlite3_column_text(statement, 1);
            NSLog(@"数据库查出name %s |||sex %s",name,sex);
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(database);
}
@end
