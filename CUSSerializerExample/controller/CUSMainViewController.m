//
//  CUSMainViewController.m
//  CUSSerializerExample
//
//  Created by zhangyu on 14-5-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "CUSMainViewController.h"
#import "CUSSerializer.h"
#import "CUSSchool.h"
#import "CUSTeacher.h"
#import "CUSStudent.h"

@interface CUSMainViewController ()

@end

@implementation CUSMainViewController
@synthesize textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"CUSSerializerExample";
    [self testCode];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.textView.frame = self.view.bounds;
}

-(void)testCode{
    //init CUSSerializer environment
    [CUSSerializer setLogStatus:NO];
    [CUSSerializer setClassMapping:@"CUSSchool" mappingFor:@"School"];
    [CUSSerializer setClassMapping:@"CUSTeacher" mappingFor:@"Teacher"];
    [CUSSerializer setClassMapping:@"CUSStudent" mappingFor:@"Student"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DictionaryFile" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    CUSSchool *school = [dictionary deserialize];
    
    NSLog(@"school:%@",school);
    NSDictionary *serializeDic = [school serialize];

    self.textView.text = [NSString stringWithFormat:@"%@",serializeDic];
}

////////////////////Example code////////////////////
-(CUSSchool *)createSchool{
    CUSSchool *school = [[CUSSchool alloc]init];
    school.schoolId = @"id0123456";
    school.schoolName = @"qinghuadaxue";
    school.schoolAddress = nil;
    school.schoolPost = 123;
    school.schoolFloat = 1234.5678;
    school.boolValue = YES;
    school.ch = 's';
    school.schoolNumber = [NSNumber numberWithInt:6];
    school.schoolDate = [NSDate date];
    school.headmaster = [self createTeacher:99];
    NSMutableArray *teacherArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        [teacherArray addObject:[self createTeacher:i]];
    }
    school.teacherArray = teacherArray;
    
    NSMutableDictionary *teacherDictionary = [NSMutableDictionary dictionary];
    for (int i = 0; i < 5; i++) {
        NSString *key = [NSString stringWithFormat:@"key%i",i];
        [teacherDictionary setObject:[self createTeacher:i] forKey:key];
    }
    school.teacherDictionary = teacherDictionary;
    return school;
}
-(CUSTeacher *)createTeacher:(NSInteger)index{
    CUSTeacher *model = [[CUSTeacher alloc]init];
    model.iden = [NSString stringWithFormat:@"teacherId%i",index];
    model.name = [NSString stringWithFormat:@"teacherName%i",index];
    model.age = 30 +index;
    model.courseName = [NSString stringWithFormat:@"courseName%i",index];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        [array addObject:[self createStudent:i]];
    }
    model.studentArray = array;
    
    return model;
}
-(CUSStudent *)createStudent:(NSInteger)index{
    CUSStudent *model = [[CUSStudent alloc]init];
    model.iden = [NSString stringWithFormat:@"studentId%i",index];
    model.name = [NSString stringWithFormat:@"studentName%i",index];
    model.age = 15 +index;
    return model;
}

-(void)dicWriteToFile:(NSDictionary *)dic{
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/DictionaryFile.plist",NSHomeDirectory()];
    [dic writeToFile:filePath atomically:YES];
}
@end
