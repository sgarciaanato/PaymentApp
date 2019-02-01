//
//  EndpointStructure.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "EndpointStructure.h"

@implementation EndpointStructure

- (id) init {
    
    self = [super init];
    
    if (self) {
        self.base_url = @"https://api.mercadopago.com/v1/";
        self.public_key = @"444a9ef5-8a6b-429f-abdf-587639155d88";
    }
    
    return self;
}

+(EndpointStructure *) getPaymentMethod {
    EndpointStructure *structure = [[EndpointStructure alloc] init];
    structure.endpoint = @"payment_methods";
    structure.method = @"GET";
    return structure;
}

+(EndpointStructure *) getCardIssuers {
    EndpointStructure *structure = [[EndpointStructure alloc] init];
    structure.endpoint = @"payment_methods/card_issuers";
    structure.method = @"GET";
    return structure;
}

-(NSString *) getStringEndpoint : (NSDictionary *) parameters {
    
    NSString *urlVars = [[NSString alloc] initWithFormat:@"?public_key=%@", self.public_key];
    for (NSString *key in parameters)
    {
        NSString *value = parameters[key];
        value = [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
        urlVars = [NSString stringWithFormat:@"%@%@%@=%@", urlVars,@"&", key, value];
    }
    
    return [[NSString alloc] initWithFormat:@"%@%@%@", self.base_url,self.endpoint, urlVars];
}


@end
