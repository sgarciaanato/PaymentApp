//
//  OrderListTableViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/3/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "OrderListTableViewController.h"

@interface OrderListTableViewController ()

@end

@implementation OrderListTableViewController

NSString * orderCell = @"orderCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: orderCell];
     
    self.orders = [OrderManager getCurrentOrders];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orders.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedOrder = [self.orders objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"goToOrderDetail" sender:nil];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCell forIndexPath:indexPath];
    
    Order *order = [self.orders objectAtIndex:indexPath.row];
    
    cell.textLabel.text = order.selectedPayerCost.recommended_message;
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"goToOrderDetail"]) {
        
        OrderDetailViewController *orderDetailViewController = segue.destinationViewController;
        orderDetailViewController.currentOrder = self.selectedOrder;
        
        return;
    }
    
}
 

@end
