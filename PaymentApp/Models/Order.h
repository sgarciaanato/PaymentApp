//
//  Order.h
//  PaymentApp
//
//  Created by Samuel on 2/3/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentMethod.h"
#import "CardIssuer.h"
#import "Installment.h"

NS_ASSUME_NONNULL_BEGIN

@interface Order : NSObject

@property (strong,nonatomic) NSString *paymentAmmount;
@property (strong,nonatomic) PaymentMethod *selectedPaymentMethod;
@property (strong,nonatomic) CardIssuer *selectedCardIssuer;
@property (strong,nonatomic) PayerCost *selectedPayerCost;
@property (strong,nonatomic) NSNumber *rate;
@property (strong,nonatomic) NSString *message;

-(id)initWithDictionary:(NSDictionary*)data;
-(NSMutableDictionary *) getDictionary;

@end

NS_ASSUME_NONNULL_END
