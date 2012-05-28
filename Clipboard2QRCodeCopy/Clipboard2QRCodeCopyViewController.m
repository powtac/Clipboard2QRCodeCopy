//
//  Clipboard2QRCodeCopyViewController.m
//  Clipboard2QRCodeCopy
//
//  Created by Simon Brüchner on 28.05.12.
//  Copyright (c) 2012 Simon Brüchner Webdesign. All rights reserved.
//

#import "Clipboard2QRCodeCopyViewController.h"
#import "Barcode.h"

@interface Clipboard2QRCodeCopyViewController ()

@end

@implementation Clipboard2QRCodeCopyViewController
@synthesize SimonImage;
@synthesize SimonLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    NSString *code = pasteboard.string; // @"1001012023034"
    
    Barcode *barcode = [[Barcode alloc] init];
    [barcode setupQRCode:code];
    
    self.SimonImage.backgroundColor = [UIColor whiteColor];
    self.SimonImage.image = barcode.qRBarcode;
    
    self.SimonLabel.text = pasteboard.string;
}

- (void)viewDidUnload
{
    [self setSimonImage:nil];
    [self setSimonLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
