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

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.validation forKey:@"validation"];
    [dictionary setValue:self.length forKey:@"length"];
    
    return dictionary;
    
}

@end

@implementation Bin

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [super init];
    if (self) {
        self.pattern = [data objectForKey:@"pattern"];
        self.installments_pattern = [data objectForKey:@"installments_pattern"];
    }
    return self;
}

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.pattern forKey:@"pattern"];
    [dictionary setValue:self.installments_pattern forKey:@"installments_pattern"];
    
    return dictionary;
    
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

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.length forKey:@"length"];
    [dictionary setValue:self.card_location forKey:@"card_location"];
    [dictionary setValue:self.mode forKey:@"mode"];
    
    return dictionary;
    
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

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:[self.card_number getDictionary] forKey:@"card_number"];
    [dictionary setValue:[self.bin getDictionary] forKey:@"bin"];
    [dictionary setValue:[self.security_code getDictionary] forKey:@"security_code"];
    
    return dictionary;
    
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

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.id forKey:@"id"];
    [dictionary setValue:self.name forKey:@"name"];
    [dictionary setValue:self.payment_type_id forKey:@"payment_type_id"];
    [dictionary setValue:self.secure_thumbnail forKey:@"secure_thumbnail"];
    [dictionary setValue:self.thumbnail forKey:@"thumbnail"];
    [dictionary setValue:self.deferred_capture forKey:@"deferred_capture"];
    NSMutableArray <NSDictionary *> *arraySettings = [[NSMutableArray alloc] init];
    for(Setting *setting in self.settings){
        [arraySettings addObject:setting.getDictionary];
    }
    [dictionary setValue:arraySettings forKey:@"settings"];
    [dictionary setValue:self.additional_info_needed forKey:@"additional_info_needed"];
    [dictionary setValue:self.min_allowed_amount forKey:@"min_allowed_amount"];
    [dictionary setValue:self.max_allowed_amount forKey:@"max_allowed_amount"];
    [dictionary setValue:self.accreditation_time forKey:@"accreditation_time"];
    [dictionary setValue:self.financial_institutions forKey:@"financial_institutions"];
    [dictionary setValue:self.processing_modes forKey:@"processing_modes"];
    
    return dictionary;
    
}

@end
