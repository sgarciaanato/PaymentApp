//
//  CardIssuer.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardIssuer : NSObject

@property (strong,nonatomic) NSString *id;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *secure_thumbnail;
@property (strong,nonatomic) NSString *thumbnail;
@property (strong,nonatomic) NSString *processing_mode;

-(id)initWithDictionary:(NSDictionary*)data;
-(NSMutableDictionary *) getDictionary;

@end

NS_ASSUME_NONNULL_END
