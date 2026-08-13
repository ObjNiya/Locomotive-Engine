#macro MIN_GUI_SCALE 1 // The minimum GUI scale the user can configure in your application's settings.

/**
 * The various resizing modes the global variable 'global.resizingMode' should be set to.
 */
enum RESIZING_MODES
{
    INTEGER = 0, // Resizes your application with an integer scale to avoid mixels in pixel art.
    FIT = 1, // Resizes your application as large as possible while maintaining the set aspect ratio.
    STRETCH = 2, // Resizes your application to stretch to the bounds of the window with no regard for the aspect ratio.
}

global.baseAppWidth = 960; // The base resolution width of your application. (The width of cameras should be set to this variable)
global.baseAppHeight = 540; // The base resolution height of your application. (The height of cameras should be set to this variable)

// The Variables below should be settings in your application's settings menu(s).

global.resizingMode = RESIZING_MODES.FIT; // How your application will be resized when the window size is changed.
global.aspectRatio = [-1, -1]; // The aspect ratio of your application as an array. (e.x: [16, 9])
global.adaptAspectRatio = false; // Whether or not to automatically adapt your applications aspect ratio to that of the monitor it's on.
global.pixelPerfect = true; // Whether or not to increase your application's resolution or if to just scale it, if this variable is set to true it will just scale it.
global.guiScale = 1; // The scale of the GUI in your application. (Works best with Pixel Perfect disabled).