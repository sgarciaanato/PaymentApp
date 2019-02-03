//
//  PaymentMethodViewController.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "NetworkingManager.h"
#import "PaymentMethod.h"
#import "CardIssuersViewController.h"
#import "UIViewController+Extension.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaymentMethodViewController : UITableViewController
@property (strong, nonatomic) NSString *paymentAmmount;

@end

NS_ASSUME_NONNULL_END
