//
//  OrderListTableViewCell.h
//  PaymentApp
//
//  Created by Samuel on 2/5/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *paymentMethodImageView;
@property (weak, nonatomic) IBOutlet UILabel *paymentMethodLabel;

@property (weak, nonatomic) IBOutlet UIImageView *cardIssuerImageView;
@property (weak, nonatomic) IBOutlet UILabel *cardIssuerLabel;

@property (weak, nonatomic) IBOutlet UIImageView *rateImageView;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;

@property (weak, nonatomic) IBOutlet UILabel *recommendedMessageLabel;

@end

NS_ASSUME_NONNULL_END
