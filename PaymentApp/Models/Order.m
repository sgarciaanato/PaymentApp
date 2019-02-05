//
//  Order.m
//  PaymentApp
//
//  Created by Samuel on 2/3/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "Order.h"

@implementation Order

-(id) init{
    self = [super init];
    if (self) {
        NSUUID *uuid = [NSUUID UUID];
        self.id = [uuid UUIDString];
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary*)data{
    self = [super init];
    if (self) {
        self.id = [data objectForKey:@"id"];
        self.paymentAmmount = [data objectForKey:@"paymentAmmount"];
        self.selectedPaymentMethod = [[PaymentMethod alloc] initWithDictionary: [data objectForKey:@"selectedPaymentMethod"]];
        self.selectedCardIssuer = [[CardIssuer alloc] initWithDictionary: [data objectForKey:@"selectedCardIssuer"]];
        self.selectedPayerCost = [[PayerCost alloc] initWithDictionary: [data objectForKey:@"selectedPayerCost"]];
        self.rate = [data objectForKey:@"rate"];
    }
    return self;
}

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.id forKey:@"id"];
    [dictionary setValue:self.paymentAmmount forKey:@"paymentAmmount"];
    [dictionary setValue:self.selectedPaymentMethod.getDictionary forKey:@"selectedPaymentMethod"];
    [dictionary setValue:self.selectedCardIssuer.getDictionary forKey:@"selectedCardIssuer"];
    [dictionary setValue:self.selectedPayerCost.getDictionary forKey:@"selectedPayerCost"];
    [dictionary setValue:self.rate forKey:@"rate"];
    
    return dictionary;
    
}

@end
