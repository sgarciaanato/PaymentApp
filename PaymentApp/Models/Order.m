//
//  Order.m
//  PaymentApp
//
//  Created by Samuel on 2/3/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "Order.h"

@implementation Order

-(id)initWithDictionary:(NSDictionary*)data{
    self = [super init];
    if (self) {
        self.paymentAmmount = [data objectForKey:@"paymentAmmount"];
        self.selectedPaymentMethod = [[PaymentMethod alloc] initWithDictionary: [data objectForKey:@"selectedPaymentMethod"]];
        self.selectedCardIssuer = [[CardIssuer alloc] initWithDictionary: [data objectForKey:@"selectedCardIssuer"]];
        self.selectedPayerCost = [[PayerCost alloc] initWithDictionary: [data objectForKey:@"selectedPayerCost"]];
    }
    return self;
}

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.paymentAmmount forKey:@"paymentAmmount"];
    [dictionary setValue:self.selectedPaymentMethod.getDictionary forKey:@"selectedPaymentMethod"];
    [dictionary setValue:self.selectedCardIssuer.getDictionary forKey:@"selectedCardIssuer"];
    [dictionary setValue:self.selectedPayerCost.getDictionary forKey:@"selectedPayerCost"];
    
    return dictionary;
    
}

@end
