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

NS_ASSUME_NONNULL_BEGIN

@interface InstallmentViewController : UIViewController

@property (strong, nonatomic) PaymentMethod *selectedPaymentMethod;
@property (strong, nonatomic) CardIssuer *selectedCardIssuer;

@end

NS_ASSUME_NONNULL_END
