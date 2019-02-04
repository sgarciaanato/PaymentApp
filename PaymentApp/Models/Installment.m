//
//  Installment.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "Installment.h"

@implementation PayerCost

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [super init];
    if (self) {
        self.installments = [data objectForKey:@"installments"];
        self.installment_rate = [data objectForKey:@"installment_rate"];
        self.discount_rate = [data objectForKey:@"discount_rate"];
        self.processing_modelabels = [data objectForKey:@"processing_modelabels"];
        self.installment_rate_collector = [data objectForKey:@"installment_rate_collector"];
        self.min_allowed_amount = [data objectForKey:@"min_allowed_amount"];
        self.max_allowed_amount = [data objectForKey:@"max_allowed_amount"];
        self.recommended_message = [data objectForKey:@"recommended_message"];
        self.installment_amount = [data objectForKey:@"installment_amount"];
        self.total_amount = [data objectForKey:@"total_amount"];
    }
    return self;
}

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.installments forKey:@"installments"];
    [dictionary setValue:self.installment_rate forKey:@"installment_rate"];
    [dictionary setValue:self.discount_rate forKey:@"discount_rate"];
    [dictionary setValue:self.processing_modelabels forKey:@"processing_modelabels"];
    [dictionary setValue:self.installment_rate_collector forKey:@"installment_rate_collector"];
    [dictionary setValue:self.min_allowed_amount forKey:@"min_allowed_amount"];
    [dictionary setValue:self.max_allowed_amount forKey:@"max_allowed_amount"];
    [dictionary setValue:self.recommended_message forKey:@"recommended_message"];
    [dictionary setValue:self.total_amount forKey:@"total_amount"];
    
    return dictionary;
    
}

@end

@implementation Installment

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [super init];
    if (self) {
        self.payment_method_id = [data objectForKey:@"payment_method_id"];
        self.payment_type_id = [data objectForKey:@"payment_type_id"];
        self.issuer = [data objectForKey:@"issuer"];
        self.processing_mode = [data objectForKey:@"processing_mode"];
        self.merchant_account_id = [data objectForKey:@"merchant_account_id"];
        NSMutableArray<PayerCost *> * payerCosts = [[NSMutableArray alloc]init];
        for (NSDictionary * payerCost in [data objectForKey:@"payer_costs"] ){
            [payerCosts addObject: [[PayerCost alloc] initWithDictionary : payerCost]];
        }
        self.payer_costs = payerCosts;
    }
    return self;
}

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.payment_method_id forKey:@"payment_method_id"];
    [dictionary setValue:self.payment_type_id forKey:@"payment_type_id"];
    [dictionary setValue:self.issuer forKey:@"issuer"];
    [dictionary setValue:self.processing_mode forKey:@"processing_mode"];
    [dictionary setValue:self.merchant_account_id forKey:@"merchant_account_id"];
    NSMutableArray <NSDictionary *> *arrayPayerCosts = [[NSMutableArray alloc] init];
    for(PayerCost *payerCost in self.payer_costs){
        [arrayPayerCosts addObject:payerCost.getDictionary];
    }
    [dictionary setValue:arrayPayerCosts forKey:@"settings"];
    [dictionary setValue:self.payer_costs forKey:@"payer_costs"];
    
    return dictionary;
    
}

@end
