//
//  Program6.mm
//  OpenGL
//
//  Created by David Stover on Sat May 15 2004.
//  Copyright (c) 2004 Little Mountain Software. All rights reserved.
//

#import "Program6.h"

#import "BMP.h"
#import "GraphicsLine.h"
#import "LineFont.h"
#import "Material.h"
#import "MyOpenGLView.h"

#import <OpenGL/gl.h>
#import <OpenGL/glu.h>

@implementation Program6

- (id) init
{
    camera = [[DeluxeCamera alloc] init];
    
    [super init];
    
    return self;
}

- (void) initializeScene
{
    GraphicsComponent *a = [LineFont A];    
    Model *A = [[Model alloc] init];
    [A setDynamic:false];    
    [A setComponentCount:1];
    [A setComponent:0:a];
    [A moveX:1.0];    
    
    GraphicsComponent *b = [LineFont B]; 
    Model *B = [[Model alloc] init];
    [B setDynamic:false];    
    [B setComponentCount:1];
    [B setComponent:0:b];
    [B moveX:4.0];  
    
    GraphicsComponent *c = [LineFont C]; 
    Model *C = [[Model alloc] init];
    [C setDynamic:false];    
    [C setComponentCount:1];
    [C setComponent:0:c];
    [C moveX:7.0];  
    
    GraphicsComponent *d = [LineFont D]; 
    Model *D = [[Model alloc] init];
    [D setDynamic:false];    
    [D setComponentCount:1];
    [D setComponent:0:d];
    [D moveX:10.0];  
    
    GraphicsComponent *e = [LineFont E]; 
    Model *E = [[Model alloc] init];
    [E setDynamic:false];    
    [E setComponentCount:1];
    [E setComponent:0:e];
    [E moveX:13.0];  
    
    GraphicsComponent *f = [LineFont F]; 
    Model *F = [[Model alloc] init];
    [F setDynamic:false];    
    [F setComponentCount:1];
    [F setComponent:0:f];
    [F moveX:16.0];  
    
    GraphicsComponent *g = [LineFont G]; 
    Model *G = [[Model alloc] init];
    [G setDynamic:false];    
    [G setComponentCount:1];
    [G setComponent:0:g];
    [G moveX:19.0];  
    
    GraphicsComponent *h = [LineFont H]; 
    Model *H = [[Model alloc] init];
    [H setDynamic:false];    
    [H setComponentCount:1];
    [H setComponent:0:h];
    [H moveX:22.0];  
    
    GraphicsComponent *i = [LineFont I]; 
    Model *I = [[Model alloc] init];
    [I setDynamic:false];    
    [I setComponentCount:1];
    [I setComponent:0:i];
    [I moveX:25.0];    
    
    GraphicsComponent *j = [LineFont J]; 
    Model *J = [[Model alloc] init];
    [J setDynamic:false];    
    [J setComponentCount:1];
    [J setComponent:0:j];
    [J moveX:28.0];    
    
    GraphicsComponent *k = [LineFont K]; 
    Model *K = [[Model alloc] init];
    [K setDynamic:false];    
    [K setComponentCount:1];
    [K setComponent:0:k];
    [K moveX:31.0];    
    
    GraphicsComponent *l = [LineFont L]; 
    Model *L = [[Model alloc] init];
    [L setDynamic:false];    
    [L setComponentCount:1];
    [L setComponent:0:l];
    [L moveX:34.0];    
    
    GraphicsComponent *m = [LineFont M]; 
    Model *M = [[Model alloc] init];
    [M setDynamic:false];    
    [M setComponentCount:1];
    [M setComponent:0:m];
    [M moveX:37.0];    
    
    GraphicsComponent *n = [LineFont N]; 
    Model *N = [[Model alloc] init];
    [N setDynamic:false];    
    [N setComponentCount:1];
    [N setComponent:0:n];
    [N moveX:40.0];    
    
    GraphicsComponent *o = [LineFont O]; 
    Model *O = [[Model alloc] init];
    [O setDynamic:false];    
    [O setComponentCount:1];
    [O setComponent:0:o];
    [O moveX:43.0];    
    
    GraphicsComponent *p = [LineFont P]; 
    Model *P = [[Model alloc] init];
    [P setDynamic:false];    
    [P setComponentCount:1];
    [P setComponent:0:p];
    [P moveX:46.0];    
    
    GraphicsComponent *q = [LineFont Q]; 
    Model *Q = [[Model alloc] init];
    [Q setDynamic:false];    
    [Q setComponentCount:1];
    [Q setComponent:0:q];
    [Q moveX:49.0];    
    
    GraphicsComponent *r = [LineFont R]; 
    Model *R = [[Model alloc] init];
    [R setDynamic:false];    
    [R setComponentCount:1];
    [R setComponent:0:r];
    [R moveX:52.0];    
    
    GraphicsComponent *s = [LineFont S]; 
    Model *S = [[Model alloc] init];
    [S setDynamic:false];    
    [S setComponentCount:1];
    [S setComponent:0:s];
    [S moveX:55.0];    
    
    GraphicsComponent *t = [LineFont T]; 
    Model *T = [[Model alloc] init];
    [T setDynamic:false];    
    [T setComponentCount:1];
    [T setComponent:0:t];
    [T moveX:58.0];    
    
    GraphicsComponent *u = [LineFont U]; 
    Model *U = [[Model alloc] init];
    [U setDynamic:false];    
    [U setComponentCount:1];
    [U setComponent:0:u];
    [U moveX:61.0];    
    
    GraphicsComponent *v = [LineFont V]; 
    Model *V = [[Model alloc] init];
    [V setDynamic:false];    
    [V setComponentCount:1];
    [V setComponent:0:v];
    [V moveX:64.0];    
    
    GraphicsComponent *w = [LineFont W]; 
    Model *W = [[Model alloc] init];
    [W setDynamic:false];    
    [W setComponentCount:1];
    [W setComponent:0:w];
    [W moveX:67.0];    
    
    GraphicsComponent *x = [LineFont X]; 
    Model *X = [[Model alloc] init];
    [X setDynamic:false];    
    [X setComponentCount:1];
    [X setComponent:0:x];
    [X moveX:70.0];    
    
    GraphicsComponent *y = [LineFont Y]; 
    Model *Y = [[Model alloc] init];
    [Y setDynamic:false];    
    [Y setComponentCount:1];
    [Y setComponent:0:y];
    [Y moveX:73.0];    
    
    GraphicsComponent *z = [LineFont Z]; 
    Model *Z = [[Model alloc] init];
    [Z setDynamic:false];    
    [Z setComponentCount:1];
    [Z setComponent:0:z];
    [Z moveX:76.0];
    
    scene = [[ModelScene alloc] init];
    [scene setModelCount:26];    
    [scene setModel:0:A];    
    [scene setModel:1:B];    
    [scene setModel:2:C];    
    [scene setModel:3:D];    
    [scene setModel:4:E];    
    [scene setModel:5:F];    
    [scene setModel:6:G];    
    [scene setModel:7:H];    
    [scene setModel:8:I];    
    [scene setModel:9:J];    
    [scene setModel:10:K];    
    [scene setModel:11:L];    
    [scene setModel:12:M];    
    [scene setModel:13:N];    
    [scene setModel:14:O];    
    [scene setModel:15:P];    
    [scene setModel:16:Q];    
    [scene setModel:17:R];    
    [scene setModel:18:S];    
    [scene setModel:19:T];    
    [scene setModel:20:U];    
    [scene setModel:21:V];    
    [scene setModel:22:W];    
    [scene setModel:23:X];    
    [scene setModel:24:Y];    
    [scene setModel:25:Z];
    
    // NYI: The scene will dealloc the model, the model will dealloc its graphics components, etc.
}

- (void) updateTime: (double) currentTime
{   
    [scene updateTime:currentTime];
    [camera updateTime:currentTime];
}
- (Scene *) getScene
{
    return scene;
}


// Must be called from the OpenGL Thread
-(void) setUpOpenGL
{
    glLineWidth(1.0);
    
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    //glEnable(GL_MULTISAMPLE);
    
    // Hints can be NICEST, FASTEST
    // Subjects of hints can be PERSPECTIVE_CORRECTION_HINT, FOG_HINT, 
    // LINE_SMOOTH_HINT, POLYGON_SMOOTH_HINT, TEXTURE_COMPRESSION_HINT
    //glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST); 
    //glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
    glEnable(GL_DEPTH_TEST);  // Use with glClearDepth(...)
    
    //glEnable(GL_LIGHTING);
    //glShadeModel(GL_SMOOTH);
    //glEnable(GL_LIGHT0);
    
    //glEnable(GL_RESCALE_NORMAL);
    //glEnable(GL_NORMALIZE);    
    glClearDepth(1000.0);
    glClearColor(0.5, 0.5, 0.5, 0);
}

- (void) keyDown: (NSEvent *) theEvent
{
    NSString *string = [theEvent characters];
    int length = [string length];
    int index = 0;
    for ( ; index < length; ++index) 
    {
        char nextChar = [string characterAtIndex:index];
        if (nextChar == 'u') 
        {
            if ([camera isRotatingPitch])
            {
                [camera stopRotatingPitch];
            } else {
                [camera startRotatingPitch];
            }
        } 
        else if (nextChar == 'j') 
        {
            if ([camera isRotatingReversePitch])
            {
                [camera stopRotatingReversePitch];
            } else {
                [camera startRotatingReversePitch];
            }
            
        } 
        else if (nextChar == 'd') 
        {
            if ([camera isRotatingYaw])
            {
                [camera stopRotatingYaw];
            } else {
                [camera startRotatingYaw];
            }
        } 
        else if (nextChar == 'a') {
            if ([camera isRotatingReverseYaw])
            {
                [camera stopRotatingReverseYaw];
            } else {
                [camera startRotatingReverseYaw];
            }
        } else if (nextChar == 'k') 
        {
            if ([camera isRotatingRoll])
            {
                [camera stopRotatingRoll];
            } else {
                [camera startRotatingRoll];
            }
        } 
        else if (nextChar == 'h') {
            if ([camera isRotatingReverseRoll])
            {
                [camera stopRotatingReverseRoll];
            } else {
                [camera startRotatingReverseRoll];
            }
        }
        else if (nextChar == 'w') {
            if ([camera isMovingForward])
            {
                [camera stopMovingForward];
            } else {
                [camera startMovingForward];
            }
        }
        else if (nextChar == 's') {
            if ([camera isMovingBackward])
            {
                [camera stopMovingBackward];
            } else {
                [camera startMovingBackward];
            }
        }        
        else if (nextChar == 'n') 
        {
            if ([camera isZoomingIn])
            {
                [camera stopZoomingIn];
            } else {
                [camera startZoomingIn];
            }
        }
        else if (nextChar == 'm')
        {
            if ([camera isZoomingOut])
            {
                [camera stopZoomingOut];
            } else {
                [camera startZoomingOut];
            }
        }
        else if (nextChar == 't')
        {
            [camera stopAllMotion];
        }
        else if (nextChar == 'r')
        {
            [camera resetPosition];
        }
    }
}

- (Camera *) getCamera
{
    return camera;
}


@end
