//
//  OrderListTableViewController.h
//  PaymentApp
//
//  Created by Samuel on 2/3/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailViewController.h"
#import "orderListTableViewCell.h"
#import "OrderManager.h"
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderListTableViewController : UITableViewController

@property (strong, nonatomic) Order *selectedOrder;
@property (strong, nonatomic) NSArray<Order *> *orders;

@end

NS_ASSUME_NONNULL_END
