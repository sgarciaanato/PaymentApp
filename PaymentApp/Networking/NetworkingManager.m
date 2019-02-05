//
//  NetworkingManager.m
//  PaymentApp
//
//  Created by Samuel on 1/31/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "NetworkingManager.h"

@implementation NetworkingManager

+(void) getPaymentMethod : (NSDictionary *) dictionary onSuccess : (void (^)(NSArray<PaymentMethod*> *, NSError *)) onSuccess{
    
    EndpointStructure *endpoint = [EndpointStructure getPaymentMethod];
    
    [[NSURLSession.sharedSession dataTaskWithRequest: [NetworkingManager getRequest : endpoint withDictionary: dictionary] completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        
        NSError *err;
        NSArray *arrayPaymentMethod = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"%@", err.localizedDescription);
            return;
        }
        
        NSMutableArray<PaymentMethod*> *paymentMethods = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dictionaryPaymentMethod in arrayPaymentMethod){
            PaymentMethod *paymentMethod = [[PaymentMethod alloc] initWithDictionary:dictionaryPaymentMethod];
            [paymentMethods addObject:paymentMethod];
        }
        
        onSuccess(paymentMethods, err);
        
        
    }] resume];
    
}

+(void) getCardIssuers : (NSDictionary *) dictionary onSuccess : (void (^)(NSArray<CardIssuer*> *, NSError *)) onSuccess{
    
    EndpointStructure *endpoint = [EndpointStructure getCardIssuers];
    
    [[NSURLSession.sharedSession dataTaskWithRequest: [NetworkingManager getRequest : endpoint withDictionary: dictionary] completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        
        NSError *err;
        NSArray *arrayCardIssuer = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"%@", err.localizedDescription);
            return;
        }
        
        NSMutableArray<CardIssuer*> *cardIssuers = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dictionaryCardIssuer in arrayCardIssuer){
            CardIssuer *cardIssuer = [[CardIssuer alloc] initWithDictionary:dictionaryCardIssuer];
            [cardIssuers addObject:cardIssuer];
        }
        
        onSuccess(cardIssuers, err);
        
        
    }] resume];
    
}

+(void) getInstallment : (NSDictionary *) dictionary onSuccess : (void (^)(Installment*, NSError *)) onSuccess{
    
    EndpointStructure *endpoint = [EndpointStructure getInstallment];
    
    [[NSURLSession.sharedSession dataTaskWithRequest: [NetworkingManager getRequest : endpoint withDictionary: dictionary] completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        
        NSError *err;
        NSArray *jsonCardIssuer = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"%@", err.localizedDescription);
            return;
        }
        
        Installment *installment = [[Installment alloc] initWithDictionary:jsonCardIssuer.firstObject];
        
        onSuccess(installment, err);
        
        
    }] resume];
    
}

+(NSMutableURLRequest *) getRequest : (EndpointStructure *) endpoint withDictionary : (NSDictionary * ) dictionary{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: [endpoint getStringEndpoint : dictionary]]];
    [request setHTTPMethod: endpoint.method];
    
    NSLog(@"%@", request);
    
    return request;
}

@end
