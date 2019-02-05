//
//  OrderManager.m
//  PaymentApp
//
//  Created by Samuel on 2/3/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "OrderManager.h"

@implementation OrderManager

NSString *ordersArrayId = @"ordersArrayId";

+(void) storeOrder : (Order *) order{
    
    NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
    NSMutableArray<NSMutableDictionary *> *ordersArray = [[NSMutableArray alloc] initWithArray:[defautls objectForKey:ordersArrayId]];
    
    if (ordersArray == NULL) {
        ordersArray = [[NSMutableArray alloc] initWithObjects: [order getDictionary], nil];
    }else{
        [ordersArray insertObject:[order getDictionary] atIndex:0];
    }
    
    [defautls setObject:ordersArray forKey:ordersArrayId];
    
}

+(NSMutableArray <Order *> *) getCurrentOrders {
    
    NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
    NSArray<NSMutableDictionary *> *ordersArray = [[NSMutableArray alloc] initWithArray:[defautls objectForKey:ordersArrayId]];
    
    if (ordersArray == NULL) {
        ordersArray = [[NSMutableArray alloc] init];
        [defautls setObject:ordersArray forKey:ordersArrayId];
    }
    
    NSMutableArray<Order *> *orders = [[NSMutableArray alloc] init];
    
    for (NSDictionary *orderDictionary in ordersArray){
        [orders addObject:[[Order alloc] initWithDictionary:orderDictionary]];
    }
    
    return orders;
    
}

+(void) saveOrder : (Order *) updatedOrder {
    
    NSMutableArray<Order *> *orders = [OrderManager getCurrentOrders];
    
    NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
    NSMutableArray<NSMutableDictionary *> *ordersArray = [[NSMutableArray alloc] initWithArray:[defautls objectForKey:ordersArrayId]];
    
    for(Order *order in orders){
        if(updatedOrder.id == order.id){
            [ordersArray replaceObjectAtIndex:[orders indexOfObject:order] withObject:[updatedOrder getDictionary]];
        }
    }
    
    [defautls setObject:ordersArray forKey:ordersArrayId];
    
}

@end
