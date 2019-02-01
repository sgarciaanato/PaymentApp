//
//  CardIssuersViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "CardIssuersViewController.h"
#import "NetworkingManager.h"
#import "CardIssuer.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CardIssuersViewController ()

@property (strong, nonatomic) NSArray<CardIssuer*> *cardIssuers;
@property (strong, nonatomic) CardIssuer *selectedCardIssuer;

@end

@implementation CardIssuersViewController

NSString * cardIssuerCell = @"cardIssuerCell";

@synthesize selectedPaymentMethod;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: cardIssuerCell];
    
    NSDictionary *parameters = @{@"payment_method_id": self.selectedPaymentMethod.id};
    
    [NetworkingManager getCardIssuers : parameters onSuccess : ^(NSArray<CardIssuer*> *cardIssuers, NSError *error) {
        
        if (error){
            NSLog(@"Error %@", error.localizedDescription);
        }
        
        self.cardIssuers = cardIssuers;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cardIssuers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cardIssuerCell forIndexPath:indexPath];
    
    CardIssuer *cardIssuer = [self.cardIssuers objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cardIssuer.name;
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:cardIssuer.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (cacheType != SDImageCacheTypeMemory){
            [self.tableView reloadRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
        }
    }];
    
    return cell;
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
