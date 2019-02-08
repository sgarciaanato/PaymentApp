//
//  OrderListTableViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/3/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "OrderListTableViewController.h"

@interface OrderListTableViewController () <OrderDetailDelegate>

@end

@implementation OrderListTableViewController

NSString * orderCell = @"orderCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
     
    self.orders = [OrderManager getCurrentOrders];
    
}

-(void) setUpView {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderListTableViewCell" bundle:nil]
         forCellReuseIdentifier:orderCell];
    self.tableView.tableFooterView = [UIView new];
}

-(void)updateOrder:(Order *)updatedOrder{
    
    NSArray<Order *> *orders = [OrderManager getCurrentOrders];
    
    [self.tableView beginUpdates];
    for(Order *order in orders){
        if(order.id == updatedOrder.id){
            //NSIndexPath *index = [[NSIndexPath alloc] initWithIndex: [orders indexOfObject:order]];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[orders indexOfObject:order] inSection:0];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
    }
    [self.tableView endUpdates];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orders.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedOrder = [self.orders objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"goToOrderDetail" sender:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCell forIndexPath:indexPath];
    
    Order *order = [self.orders objectAtIndex:indexPath.row];
    
    cell.recommendedMessageLabel.text = order.selectedPayerCost.recommended_message;
    [cell.paymentMethodImageView sd_setImageWithURL:[NSURL URLWithString:order.selectedPaymentMethod.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [cell.paymentMethodLabel setText:order.selectedPaymentMethod.name];
    
    [cell.cardIssuerImageView sd_setImageWithURL:[NSURL URLWithString:order.selectedCardIssuer.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [cell.cardIssuerLabel setText:order.selectedCardIssuer.name];
    [cell.dateLabel setText:order.date];
    [cell.recommendedMessageLabel setText:order.selectedPayerCost.recommended_message];
    
    if(order.rate == nil){
        [cell.rateImageView setImage:[UIImage imageNamed:@"icon-0-star"]];
        [cell.rateLabel setText:@""];
    }else{
        [cell.rateImageView setImage:[UIImage imageNamed:[[NSString alloc] initWithFormat:@"icon-%i-star",[order.rate intValue]]]];
        [cell.rateLabel setText: [[NSString alloc] initWithFormat:@"%@", order.rate]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"goToOrderDetail"]) {
        
        OrderDetailViewController *orderDetailViewController = segue.destinationViewController;
        orderDetailViewController.delegate = self;
        orderDetailViewController.currentOrder = self.selectedOrder;
        
        return;
    }
    
}
 

@end
