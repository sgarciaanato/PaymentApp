//
//  PaymentAmmountViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "PaymentAmmountViewController.h"

@interface PaymentAmmountViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *ammountTextField;
@property (weak, nonatomic) IBOutlet UIButton *paymentButton;
@property (weak, nonatomic) IBOutlet UIButton *paymentHistory;

@end

@implementation PaymentAmmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpButtons];
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self animateEntry];
    });
    
}

-(void) setUpButtons {
    
    [[self.containerView layer] setCornerRadius: 8];
    [[self.paymentButton layer] setCornerRadius: 8];
    [[self.paymentButton layer] setBorderWidth: 1];
    [[self.paymentButton layer] setBorderColor: UIColor.lightGrayColor.CGColor];
    [[self.paymentHistory layer] setCornerRadius: 8];
    [[self.paymentHistory layer] setBorderWidth: 1];
    [[self.paymentHistory layer] setBorderColor: UIColor.lightGrayColor.CGColor];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (IBAction)unwindToPaymentAmmountViewController:(UIStoryboardSegue *)unwindSegue{
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        
        [self saveOrder];
        
        [self performSegueWithIdentifier:@"goToOrderDetail" sender:nil];
    });
    
}

-(void) saveOrder {
    
    [OrderManager storeOrder: self.currentOrder];

}

- (int)numberOfOccurencesOfSubstring:(NSString *)substring inString:(NSString*)string
{
    NSArray *components = [string componentsSeparatedByString:substring];
    return (int)components.count-1; // Two substring will create 3 separated strings in the array.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if ([identifier isEqualToString:@"goToOrders"] && ([OrderManager getCurrentOrders].count <= 0)) {
        [self showMessage:@"No tienes pagos para mostrar"];
        return false;
    }else if ([identifier isEqualToString:@"goToPaymentMethod"]) {
        return [self evaluateAmmount];
    }
    return true;
}

-(Boolean) evaluateAmmount {
    
    if ([self.ammountTextField.text  isEqual: @""] || self.ammountTextField.text.length <= 0) {
        return false;
    }
    if([self numberOfOccurencesOfSubstring:@"," inString:self.ammountTextField.text] > 1 || [self numberOfOccurencesOfSubstring:@"." inString:self.ammountTextField.text] > 1){
        [self showMessage:@"Ingrese un monto válido"];
        return false;
    }
    
    if([[self.ammountTextField.text stringByReplacingOccurrencesOfString:@"," withString:@"."] floatValue] <= 0.01){
        [self showMessage:@"Ingrese un monto válido"];
        return false;
    }
    
    return true;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"goToPaymentMethod"]) {
        
        PaymentMethodViewController *paymentMethodViewController = segue.destinationViewController;
        paymentMethodViewController.paymentAmmount = [self.ammountTextField.text stringByReplacingOccurrencesOfString:@"," withString:@"."];
        
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
        
        self.ammountTextField.text = @"";
        
        return;
    }
    
    if ([[segue identifier] isEqualToString:@"goToOrderDetail"]) {
        
        OrderDetailViewController *orderDetailViewController = segue.destinationViewController;
        orderDetailViewController.currentOrder = self.currentOrder;
        
        return;
    }
}


@end
