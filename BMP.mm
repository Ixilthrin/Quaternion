//
//  BMP.m
//  OpenGL
//
//  Created by David Stover on Thu Feb 19 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "BMP.h"

@implementation BMP

- (id) init
{    
    [super init];
    
    return self;
}

// Return -1 on error.
- (int) readWithCString: (const char *) bmpPath
{
    NSString *string = [NSString stringWithCString:bmpPath];
    return [self readWithString:string];
}

// Return -1 on error.
- (int) readWithString: (NSString *) bmpPath
{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:bmpPath];
    return [self readWithFileHandle:handle];
}

// Return -1 on read error.
- (int) readWithFileHandle: (NSFileHandle *) bmpFile 
{   
    // First two bytes are "BM"
    NSData *data = [bmpFile readDataOfLength:2];
    if ([data length] < 2)
    {
        return -1;
    }
    char bmString[2];
    [data getBytes:bmString length:2];
    if (bmString[0] != 'B' || bmString[1] != 'M') 
    {
        return -1;
    }
    
    // Next 4 bytes are the file size in little endian order.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    fileSize = [self readInt:4:data];
    //printf("filesize = %d\n", fileSize);
    
    // Next 4 bytes are reserved.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    firstReserved = [self readInt:4:data];
    
    // Next 4 bytes is the picture offset.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    pictureOffset = [self readInt:4:data];
    // Next 4 bytes is the header size.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    headerSize = [self readInt:4:data];
    // Next 4 bytes is the image width.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    width = [self readInt:4:data];
    //printf ("width = %d\n", width);
    // Next 4 bytes is the image height.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    height = [self readInt:4:data];
    //printf ("height = %d\n", height);
    // Next 2 bytes is the number of bit planes.
    data = [bmpFile readDataOfLength:2];
    if ([data length] < 2)
    {
        return -1;
    }
    bitPlanes = [self readInt:2:data];
    //printf ("bitPlanes = %d\n", bitPlanes);
    // Next 2 bytes is the color depth in bits per pixel.
    data = [bmpFile readDataOfLength:2];
    if ([data length] < 2)
    {
        return -1;
    }
    colorDepth = [self readInt:2:data];
    //printf ("colorDepth = %d\n", colorDepth);
    // Next 4 bytes is the compression type
    // Normally 0.
    // 1 indicates run length encoding of 8 bits per pixel.
    // 2 indicates run length encoding of 4 bits per pixel.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    compression = [self readInt:4:data];
    //printf ("compression = %d\n", compression);
    // Next 4 bytes is the compressed image size.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    compressedImageSize = [self readInt:4:data];
    //printf ("compressedImageSize = %d\n", compressedImageSize);
    // Next 4 bytes is the horizontal resolution.
    // pixels per meter
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    horizontalResolution = [self readInt:4:data];
    //printf ("horizontalResolution = %d\n", horizontalResolution);
    // Next 4 bytes is the vertical resolution.
    // pixels per meter
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    verticalResolution = [self readInt:4:data];
    //printf ("verticalResolution = %d\n", verticalResolution);
    // Next 4 bytes is the number of colors used.
    // NCL: value = 0 for full color set
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    colorsUsed = [self readInt:4:data];
    //printf ("colorsUsed = %d\n", colorsUsed);
    // Next 4 bytes is the number of important colors.
    // NIC: value = 0 implies all colors are important.
    data = [bmpFile readDataOfLength:4];
    if ([data length] < 4)
    {
        return -1;
    }
    importantColors = [self readInt:4:data];
    //printf ("importantColors = %d\n", importantColors);
    // Next is the color pallete
    // NYI: For now just read the bytes and throw away.
    // 1 byte each for blue, green, red. 1 byte reserved 
    unsigned int paletteLength = colorsUsed * 4;
    data = [bmpFile readDataOfLength:paletteLength];
    if ([data length] < paletteLength)
    {
        return -1;
    }
    // Image: left to right, top to bottum order
    int bytesPerPixel = colorDepth / 8;
    int horizontalPadding = (4 - ((width * bytesPerPixel) % 4)) % 4;
    colorValues = (unsigned char *)
        malloc(sizeof(unsigned char) * bytesPerPixel * height * width);
    int colorValueIndex = 0;
    int row = 0;
    int column = 0;
    for (row = height; row > 0; --row)
    {
        for (column = 0; column < width; ++column) 
        {
            // read the blue value, green value, red value
            data = [bmpFile readDataOfLength:3];
            if ([data length] < 3)
            {
                return -1;
            }
            unsigned char nextThree[3];
            [data getBytes:nextThree length:3];
            colorValues[colorValueIndex++] = nextThree[2];
            //printf("red = %d\n", (unsigned int) nextThree[2]);
            colorValues[colorValueIndex++] = nextThree[1];
            //printf("green = %d\n", (unsigned int) nextThree[1]);
            colorValues[colorValueIndex++] = nextThree[0];
            //printf("blue = %d\n", (unsigned int) nextThree[0]);
        }
        // Read and throw away the padding.
        unsigned int paddingLength = horizontalPadding * bytesPerPixel;
        data = [bmpFile readDataOfLength:paddingLength];
        if ([data length] < paddingLength)
        {
            return -1;
        }
    }
    //printf("done\n");
    return 0;
}

- (int) readInt: (int) byteLength: (NSData *) data
{
    char nextFour[byteLength];
    [data getBytes:nextFour length:byteLength];
    int intValue = 0;
    int i = 0;
    int j = 0;
    for (i = 0; i < byteLength; i++) 
    {
        int c = (int) nextFour[i];
        for (j = 0; j < i; ++j)
        {
            // Shift 1 byte
            c = c << 8;
        }
        intValue += c;
    }
    return intValue;
}

- (int) getColorDepth
{
    return colorDepth;
}

- (unsigned char *) getColorValues
{
    return colorValues;
}

@end
