//
//  AppDelegate.h
//  PaymentApp
//
//  Created by Samuel on 1/31/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

