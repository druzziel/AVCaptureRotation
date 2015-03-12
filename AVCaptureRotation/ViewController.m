//
//  ViewController.m
//  AVCaptureRotationDemo
//
//  Created by David Roth on 3/3/15.
//  Copyright (c) 2015 David Roth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupInput];
    [self setupOutput];
//    [self addLabel];
    [self.captureSession startRunning];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}


-(void)setupInput
{
    AVCaptureSession *captureSession = [AVCaptureSession new];
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if ([captureSession canAddInput:videoInput]) {
        [captureSession addInput:videoInput];
    } else {
        NSLog(@"Error opening input device: %@", [error localizedDescription]);
    }
    
    self.captureSession = captureSession;
    
}

-(void)setupOutput
{
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
    CGRect bounds=self.view.layer.bounds;
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    previewLayer.bounds = bounds;
    previewLayer.position = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    [self.previewView.layer addSublayer:previewLayer];
    self.previewLayer = previewLayer;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

-(void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation orientation =[[UIDevice currentDevice]orientation];

    CGAffineTransform rotationTransform;
    
    switch (orientation) {
        case UIDeviceOrientationLandscapeRight:
            rotationTransform = CGAffineTransformMakeRotation(M_PI+ M_PI_2); // 270 degress
            break;
        case UIDeviceOrientationLandscapeLeft:
            rotationTransform = CGAffineTransformMakeRotation(M_PI_2); // 90 degrees
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            rotationTransform = CGAffineTransformMakeRotation(M_PI); // 180 degrees
            break;
        default:
            rotationTransform = CGAffineTransformMakeRotation(0.0);
            break;
    }

    for (UIView *thisView in self.view.subviews) {
        if ([thisView isKindOfClass:[UILabel class]]) {
            [UIView animateWithDuration:0.75
                                  delay:0.25
                 usingSpringWithDamping:0.8
                  initialSpringVelocity:2.0
                                options: UIViewAnimationOptionCurveLinear
                             animations:^{
                                 thisView.transform = rotationTransform;
                             }
                             completion:^(BOOL finished){
                             }];
            
        }
    }
    
}

@end
