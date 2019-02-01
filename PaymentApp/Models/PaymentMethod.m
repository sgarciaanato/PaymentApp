//
//  PaymentMethod.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "PaymentMethod.h"

@implementation CardNumber

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [super init];
    if (self) {
        self.validation = [data objectForKey:@"validation"];
        self.length = [data objectForKey:@"length"];
    }
    return self;
}

@end

@implementation Bin

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [super init];
    if (self) {
        self.pattern = [data objectForKey:@"pattern"];
        self.installments_pattern = [data objectForKey:@"installments_pattern"];
        self.exclusion_pattern = [data objectForKey:@"exclusion_pattern"];
    }
    return self;
}

@end

@implementation SecurityCode

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [super init];
    if (self) {
        self.length = [data objectForKey:@"length"];
        self.card_location = [data objectForKey:@"card_location"];
        self.mode = [data objectForKey:@"mode"];
    }
    return self;
}

@end

@implementation Setting

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [super init];
    if (self) {
        self.card_number = [[CardNumber alloc] initWithDictionary : [data objectForKey:@"card_number"]];
        self.bin = [[Bin alloc] initWithDictionary : [data objectForKey:@"bin"]];
        self.security_code = [[SecurityCode alloc] initWithDictionary : [data objectForKey:@"security_code"]];
    }
    return self;
}

@end

@implementation PaymentMethod

    -(id)initWithDictionary:(NSDictionary*)data
    {
        self = [super init];
        if (self) {
            self.id = [data objectForKey:@"id"];
            self.name = [data objectForKey:@"name"];
            self.payment_type_id = [data objectForKey:@"payment_type_id"];
            self.status = [data objectForKey:@"status"];
            self.secure_thumbnail = [data objectForKey:@"secure_thumbnail"];
            self.thumbnail = [data objectForKey:@"thumbnail"];
            self.deferred_capture = [data objectForKey:@"deferred_capture"];
            NSMutableArray<Setting *> * settings = [[NSMutableArray alloc]init];
            for (NSDictionary * setting in [data objectForKey:@"settings"] ){
                [settings addObject: [[Setting alloc] initWithDictionary : setting]];
            }
            self.settings = settings;
            self.additional_info_needed = [data objectForKey:@"additional_info_needed"];
            self.min_allowed_amount = [data objectForKey:@"min_allowed_amount"];
            self.max_allowed_amount = [data objectForKey:@"max_allowed_amount"];
            self.accreditation_time = [data objectForKey:@"accreditation_time"];
            self.financial_institutions = [data objectForKey:@"financial_institutions"];
            self.processing_modes = [data objectForKey:@"processing_modes"];
        }
        return self;
    }

@end
