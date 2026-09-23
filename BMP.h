//
//  BMP.h
//  OpenGL
//
//  Created by David Stover on Thu Feb 19 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BMP : NSObject {
    int fileSize;
    int firstReserved;
    int pictureOffset;
    int headerSize;
    int width;
    int height;
    int bitPlanes;
    int colorDepth; // Number of bits, e.g. 24 bit color.
    int compression;
    int compressedImageSize;
    int horizontalResolution;
    int verticalResolution;
    int colorsUsed;
    int importantColors;
    // colorValues: left to right, top to bottum, red, green blue order
    // Each pixel is colorDepth / 8 bytes in length
    unsigned char *colorValues;
    int sizeOfColorValues;
}
- (id) init;
// Return -1 on error.
- (int) readWithCString: (const char *) bmpPath;

// Return -1 on error.
- (int) readWithString: (NSString *) bmpPath;
// Return -1 on error
- (int) readWithFileHandle: (NSFileHandle *) bmpFile;
- (int) readInt: (int) byteLength: (NSData *) data;
- (int) getColorDepth;
- (unsigned char *) getColorValues;

@end
