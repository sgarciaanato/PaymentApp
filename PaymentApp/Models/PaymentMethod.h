//
//  PaymentMethod.h
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardNumber : NSObject

@property (strong, nonatomic) NSString *validation;
@property (strong, nonatomic) NSNumber *length;

-(NSMutableDictionary *) getDictionary;

@end

@interface Bin : NSObject

@property (strong, nonatomic) NSString *pattern;
@property (strong, nonatomic) NSString *installments_pattern;

-(NSMutableDictionary *) getDictionary;

@end

@interface SecurityCode : NSObject

@property (strong, nonatomic) NSNumber *length;
@property (strong, nonatomic) NSString *card_location;
@property (strong, nonatomic) NSString *mode;

-(NSMutableDictionary *) getDictionary;

@end

@interface Setting : NSObject

@property (strong, nonatomic) CardNumber *card_number;
@property (strong, nonatomic) Bin *bin;
@property (strong, nonatomic) SecurityCode *security_code;

-(id)initWithDictionary:(NSDictionary*)data;
-(NSMutableDictionary *) getDictionary;

@end

@interface PaymentMethod : NSObject

@property (strong,nonatomic) NSString *id;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *payment_type_id;
@property (strong,nonatomic) NSString *status;
@property (strong,nonatomic) NSString *secure_thumbnail;
@property (strong,nonatomic) NSString *thumbnail;
@property (strong,nonatomic) NSString *deferred_capture;
@property (strong,nonatomic) NSArray<Setting *> *settings;
@property (strong,nonatomic) NSArray<NSString *> *additional_info_needed;
@property (strong,nonatomic) NSNumber *min_allowed_amount;
@property (strong,nonatomic) NSNumber *max_allowed_amount;
@property (strong,nonatomic) NSNumber *accreditation_time;
@property (strong,nonatomic) NSArray<NSString *> *financial_institutions;
@property (strong,nonatomic) NSArray<NSString *> *processing_modes;

-(id)initWithDictionary:(NSDictionary*)data;
-(NSMutableDictionary *) getDictionary;

@end

NS_ASSUME_NONNULL_END
