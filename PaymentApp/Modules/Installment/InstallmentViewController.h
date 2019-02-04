//
//  InstallmentViewController.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "NetworkingManager.h"
#import "Installment.h"
#import "PaymentAmmountViewController.h"
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@interface InstallmentViewController : UIViewController

@property (strong, nonatomic) PaymentMethod *selectedPaymentMethod;
@property (strong, nonatomic) CardIssuer *selectedCardIssuer;
@property (strong, nonatomic) NSString *paymentAmmount;
@property (strong, nonatomic) Order *currentOrder;

@end

NS_ASSUME_NONNULL_END
