//
//  OrderDetailViewController.h
//  PaymentApp
//
//  Created by Samuel on 2/2/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "OrderManager.h"
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OrderDetailDelegate<NSObject>
-(void)updateOrder:(Order *)orupdatedOrderder;
@end

@interface OrderDetailViewController : UIViewController

@property (strong, nonatomic) Order *currentOrder;

@property(weak,nonatomic)id<OrderDetailDelegate> delegate;
-(void)updateOrder:(Order *)updatedOrder;

@end

NS_ASSUME_NONNULL_END
