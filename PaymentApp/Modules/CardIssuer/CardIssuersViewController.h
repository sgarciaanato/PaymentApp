//
//  CardIssuersViewController.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentMethod.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardIssuersViewController : UITableViewController

@property (strong, nonatomic) PaymentMethod *selectedPaymentMethod;

@end

NS_ASSUME_NONNULL_END
