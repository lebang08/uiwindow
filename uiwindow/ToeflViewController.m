//
//  ToeflViewController.m
//  uiwindow
//
//  Created by apple on 2017/3/19.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "ToeflViewController.h"
#import "Country.h"
#import "ModuleViewController.h"

@interface ToeflViewController ()<ModuleDelegate>

@property(strong,nonatomic) NSMutableArray *list;
@property(strong,nonatomic) NSMutableString *argument;

@end

@implementation ToeflViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.list = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 9; i++) {
        //        Country *American = [[Country alloc]init];
        //        American.capital = @"NewYork";
        //        American.name = @"American";
        
        NSString* item = [NSString stringWithFormat:@"%d",i];
        [self.list addObject:item];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //    switch (<#expression#>) {
    //        case <#constant#>:
    //            <#statements#>
    //            break;
    //
    //        default:
    //            break;
    //    }
    return @"Country introduce:";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifliter = @"Itoefl";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifliter];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifliter];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:19.0];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0];
    }
    
    NSString *content = [self.list objectAtIndex:indexPath.row];
    cell.textLabel.text = content;
    cell.detailTextLabel.text = content;
    return cell;
}

//不好的方法
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.argument = [self.country objectAtIndex:indexPath.row];
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ModuleViewController *moduleViewControll = [mainStoryboard instantiateViewControllerWithIdentifier:@"moduleView"];
//    moduleViewControll.name = [self.country objectAtIndex:indexPath.row];
//    [self presentViewController: moduleViewControll animated:YES completion:nil];
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ModuleViewController *moduleViewcontrol = segue.destinationViewController;
    moduleViewcontrol.mDelegate = self;
    NSIndexPath *pos = [self.tableView indexPathForSelectedRow];
    moduleViewcontrol.name = [self.list objectAtIndex:pos.row];
}

-(void)setString:(NSString *)arg{
    [self.list addObject:arg];
}
//Todo detail 返回值给tableview  . 另记住这个方法indexPathForSelectedRow
@end
