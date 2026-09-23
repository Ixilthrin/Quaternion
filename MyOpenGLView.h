/* MyOpenGLView */

#import <Cocoa/Cocoa.h>
#import "Program.h"
#import "StandardCamera.h"
#import "Scene.h"

@interface MyOpenGLView : NSOpenGLView
{
    NSPoint mousePoint;
    Camera *camera;
    Program *program;
}
- (id) initWithCoder: (NSCoder *) coder;
- (void) setUpOpenGL;
- (void) dealloc;
- (void) mouseDown: (NSEvent *) theEvent;
- (void) mouseDragged: (NSEvent *) theEvent;

- (void) keyDown: (NSEvent *) theEvent;
- (void) drawRect: (NSRect) bounds;
@end
