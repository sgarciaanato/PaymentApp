//
//  PaymentAmmountViewController.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentMethodViewController.h"
#import "OrderDetailViewController.h"
#import "OrderManager.h"
#import "Installment.h"
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaymentAmmountViewController : UIViewController

@property (strong, nonatomic) NSString *paymentAmmount;
@property (strong, nonatomic) Order *currentOrder;

@end

NS_ASSUME_NONNULL_END
