//
//  EndpointStructure.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EndpointStructure : NSObject

@property NSString *base_url;
@property NSString *endpoint;
@property NSString *method;
@property NSString *public_key;

+(EndpointStructure *) getPaymentMethod;
+(EndpointStructure *) getCardIssuers;
+(EndpointStructure *) getInstallment;
-(NSString *) getStringEndpoint : (NSDictionary *) parameters;

@end

NS_ASSUME_NONNULL_END
