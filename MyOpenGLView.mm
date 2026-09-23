#import "MyOpenGLView.h"

#import <OpenGL/gl.h>
#import <OpenGL/glu.h>
#import "Model.h"
#import "Scene.h"
#import "MainProgram.h"

#define PROGRAM_NUMBER 5

@implementation MyOpenGLView

-(void) setUpOpenGL
{    
    program = [MainProgram getProgram:PROGRAM_NUMBER];
    [program setUpOpenGL];
    camera = [program getCamera];
}

- (void) mouseDown: (NSEvent *) theEvent
{
}

- (void) mouseDragged: (NSEvent *) theEvent
{
}

- (void) keyDown: (NSEvent *) theEvent
{
    [program keyDown:theEvent];
}


// This is called by the NS framework.
- (id) initWithCoder: (NSCoder *) coder
{         
    self = [super initWithCoder: coder];
    
    int numberOfAttributes = 0; 
    
    bool doubleBuffering = true;
    
    if (doubleBuffering) {
        ++numberOfAttributes;
    }
    
    NSOpenGLPixelFormatAttribute *attrs = 
        (NSOpenGLPixelFormatAttribute *) malloc(sizeof(NSOpenGLPixelFormatAttribute) * numberOfAttributes + 1);
    
    int index = 0;
    
    if (doubleBuffering) {
        // PFA = pixel format attribute
        attrs[index++] = NSOpenGLPFADoubleBuffer;        
    }
    
    attrs[index++] = NSOpenGLPFADepthSize;
    attrs[index++] = (NSOpenGLPixelFormatAttribute) 32;
    
    attrs[index] = (NSOpenGLPixelFormatAttribute) nil;
    
    NSOpenGLPixelFormat *pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes: attrs];
        
    [self setPixelFormat: pixelFormat];
    
    free(attrs);
    [pixelFormat release];
        
    long swapInterval;

    // The buffer will be swapped in sync with screen refresh.
    
    swapInterval = 1;
    
    [[self openGLContext] setValues: &swapInterval forParameter: NSOpenGLCPSwapInterval ];
    
    [self setUpOpenGL];
     
    return self;
}

- (void) drawRect: (NSRect) bounds
{
    Scene *scene = [program getScene];
    if (!scene) {
        return;
    }
    [scene setCamera:camera];

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

     
    [camera doProjection];
    [camera prepareView];
    /*
    int error = glGetError();
    if (error != GL_NO_ERROR) {
         printf("Error: ");
        if (error == GL_INVALID_VALUE) {
            printf("INVALID VALUE\n");
        } else 
        if (error == GL_INVALID_OPERATION) {
            printf("INVALID OPERATION\n");
        } else 
        if (error == GL_INVALID_ENUM) {
            printf("INVALID ENUM\n");
        } else 
        if (error == GL_OUT_OF_MEMORY) {
            printf("INVALID VALUE\n");
        } else
        if (error == GL_STACK_OVERFLOW) {
            printf("STACK OVERFLOW\n");
        } else
        if (error == GL_STACK_UNDERFLOW) {
            printf("STACK UNDERFLOW\n");
        } else {
           printf("Error Unknown\n");
        }
    }*/   
    
    //[scene doLighting];
    [scene draw];
    
    glFinish();

    [[self openGLContext] flushBuffer];
}

- (void) dealloc
{
}

// Required to accept keyboard events.
- (BOOL)acceptsFirstResponder
{
	return YES;
}

// Required to accept keyboard events.
- (BOOL)becomeFirstResponder
{
	return YES;
}

// Required to accept keyboard events.
- (BOOL)resignFirstResponder
{
	return YES;
}

- (void) setProgram: (Program*) p
{
    program = p;
}

@end


