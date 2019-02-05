//
//  DefaultTableViewCell.h
//  PaymentApp
//
//  Created by Samuel on 2/5/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DefaultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *defaultImageView;
@property (weak, nonatomic) IBOutlet UILabel *defaultTextLabel;

@end

NS_ASSUME_NONNULL_END
