//
//  ViewController.h
//  AVCaptureRotationDemo
//
//  Created by David Roth on 3/3/15.
//  Copyright (c) 2015 David Roth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *previewView;
@property (strong, nonatomic) AVCaptureSession *captureSession;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property (strong, nonatomic) IBOutlet UILabel *rotationLabel;
@end

