//
//  CardIssuersViewController.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "NetworkingManager.h"
#import "PaymentMethod.h"
#import "CardIssuer.h"
#import "InstallmentViewController.h"
#import "DefaultTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardIssuersViewController : UITableViewController

@property (strong, nonatomic) PaymentMethod *selectedPaymentMethod;
@property (strong, nonatomic) NSString *paymentAmmount;

@end

NS_ASSUME_NONNULL_END
