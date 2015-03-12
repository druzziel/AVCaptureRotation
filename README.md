# AVCaptureRotation
Illustrates a technique for rotating the subviews of a UIView which does not rotate.

If you are using an AVCaptureVideoPreviewLayer in a scene, you may not want to rotate it.  If that is the case, but you also want to have views in front of the AVCaptureVideoPreviewLayer that CAN respond to rotations (like buttons or labels), then you can do so by creating a notificaton observer for UIDeviceOrientationDidChangeNotification.  When the @selector for your observer gets triggered, you can apply rotations to all of the subviews of the view containing the AVCaptureVideoPreviewLayer.
