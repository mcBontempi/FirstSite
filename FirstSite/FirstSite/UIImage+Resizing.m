//
//  UIImage+Resizing.m
//  FirstSite
//
//  Created by Daren taylor on 08/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "UIImage+Resizing.h"

@implementation UIImage (Resizing)

- (UIImage*) resizedImageWithSize:(CGSize)size
{
	UIGraphicsBeginImageContext(size);
	
	[self drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
	
	// An autoreleased image
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return newImage;
}

@end
