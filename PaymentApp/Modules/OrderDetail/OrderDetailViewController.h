//
//  OrderDetailViewController.h
//  PaymentApp
//
//  Created by Samuel on 2/2/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "PaymentMethodViewController.h"
#import "Installment.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailViewController : UIViewController

@property (strong, nonatomic) PaymentMethod *selectedPaymentMethod;
@property (strong, nonatomic) CardIssuer *selectedCardIssuer;
@property (strong, nonatomic) NSString *paymentAmmount;
@property (strong, nonatomic) PayerCost *selectedPayerCost; 

@end

NS_ASSUME_NONNULL_END
