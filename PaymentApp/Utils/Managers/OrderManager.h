//
//  OrderManager.h
//  PaymentApp
//
//  Created by Samuel on 2/3/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderManager : NSObject

+(void) storeOrder : (Order *) order;
+(NSMutableArray <Order *> *) getCurrentOrders;
+(void) saveOrder : (Order *) updatedOrder;

@end

NS_ASSUME_NONNULL_END
