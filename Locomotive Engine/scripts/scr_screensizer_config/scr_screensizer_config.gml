#macro MIN_GUI_SCALE 1 // The minimum GUI scale the user can configure in the application's settings.

/**
 * The various resizing modes the global variable 'global.resizingMode' should be set to.
 */
enum RESIZING_MODES
{
    INTEGER = 0, // Resizes the application with an integer scale to avoid mixels in pixel art.
    FIT = 1, // Resizes the application as large as possible while maintaining the set aspect ratio.
    STRETCH = 2, // Resizes the application to stretch to the bounds of the window with no regard for the aspect ratio.
}

global.baseAppWidth = 960; // The base resolution width of the application. (The width of cameras should be set to this variable)
global.baseAppHeight = 540; // The base resolution height of the application. (The height of cameras should be set to this variable)

// The Variables below should be settings in the application's settings menu(s).

global.resizingMode = RESIZING_MODES.FIT; // How the application will be resized when the window size is changed.
global.aspectRatio = [-1, -1]; // The aspect ratio of the application as an array. (e.x: [16, 9])
global.adaptAspectRatio = false; // Whether or not to automatically adapt the applications aspect ratio to that of the monitor it's on.
global.pixelPerfect = false; // Whether or not to increase the application's resolution or if to just scale it, if this variable is set to true it will just scale it.
global.guiScale = 1; // The scale of the GUI in the application. (Works best with Pixel Perfect disabled).