//
//  CardIssuer.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "CardIssuer.h"

@implementation CardIssuer

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [super init];
    if (self) {
        self.id = [data objectForKey:@"id"];
        self.name = [data objectForKey:@"name"];
        self.secure_thumbnail = [data objectForKey:@"secure_thumbnail"];
        self.processing_mode = [data objectForKey:@"processing_mode"];
        self.merchant_account_id = [data objectForKey:@"merchant_account_id"];
    }
    return self;
}

@end
