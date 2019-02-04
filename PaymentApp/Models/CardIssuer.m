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
    }
    return self;
}

-(NSMutableDictionary *)getDictionary {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:self.id forKey:@"id"];
    [dictionary setValue:self.name forKey:@"name"];
    [dictionary setValue:self.secure_thumbnail forKey:@"secure_thumbnail"];
    [dictionary setValue:self.processing_mode forKey:@"processing_mode"];
    
    return dictionary;
    
}

@end
