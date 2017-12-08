//
//  TableViewController.m
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TableViewController.h"
@interface TableViewController ()
@end
@implementation TableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
// Initiating data model in viewDidLoad.
    self.data = [[dataModel alloc] init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// Number of columns.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// Number of rows, defined by data model.
    NSInteger numberOfRows;
    if (section == 0) {
        numberOfRows = self.data.equipment.count;
    }
    return numberOfRows;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
// Data model properties defines cell title and detail. 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"equipmentCell" forIndexPath:indexPath];
    if(indexPath.section == 0){
        equipment *tempequipment = [self.data.equipment objectAtIndex:indexPath.row];
        cell.textLabel.text = tempequipment.name;
        cell.detailTextLabel.text = tempequipment.calibre;
    }
    return cell;
}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// Gathers the correct information from the data model depending on the cell selected.
    if ([[segue identifier] isEqualToString:@"showEquipmentDetails"]) {
        DetailsViewController *destinationViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath.section == 0) {
            equipment *tempequipment = [self.data.equipment objectAtIndex:indexPath.row];
            destinationViewController.equipment = tempequipment;
        }
    }
}
@end
