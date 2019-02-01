//
//  NetworkingManager.h
//  PaymentApp
//
//  Created by Samuel on 1/31/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentMethod.h"
#import "CardIssuer.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkingManager : NSObject

+(void) getPaymentMethod : (NSDictionary *) dictionary onSuccess : (void (^)(NSArray<PaymentMethod*> *, NSError *)) onSuccess;
+(void) getCardIssuers : (NSDictionary *) dictionary onSuccess : (void (^)(NSArray<CardIssuer*> *, NSError *)) onSuccess;

@end

NS_ASSUME_NONNULL_END
