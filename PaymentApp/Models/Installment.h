//
//  Installment.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardIssuer.h"

NS_ASSUME_NONNULL_BEGIN

@interface PayerCost : NSObject

@property (strong,nonatomic) NSNumber *installments;
@property (strong,nonatomic) NSNumber *installment_rate;
@property (strong,nonatomic) NSNumber *discount_rate;
@property (strong,nonatomic) NSArray<NSString *> *processing_modelabels;
@property (strong,nonatomic) NSArray<NSString *> *installment_rate_collector;
@property (strong,nonatomic) NSNumber *min_allowed_amount;
@property (strong,nonatomic) NSNumber *max_allowed_amount;
@property (strong,nonatomic) NSString *recommended_message;
@property (strong,nonatomic) NSNumber *installment_amount;
@property (strong,nonatomic) NSNumber *total_amount;

-(id)initWithDictionary:(NSDictionary*)data;

@end

@interface Installment : NSObject

@property (strong,nonatomic) NSString *payment_method_id;
@property (strong,nonatomic) NSString *payment_type_id;
@property (strong,nonatomic) CardIssuer *issuer;
@property (strong,nonatomic) NSString *processing_mode;
@property (strong,nonatomic) NSString *merchant_account_id;
@property (strong,nonatomic) NSArray<PayerCost *> *payer_costs;

-(id)initWithDictionary:(NSDictionary*)data;

@end

NS_ASSUME_NONNULL_END
