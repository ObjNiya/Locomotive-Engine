gpu_set_blendenable(false);

if (appScriptBegin != -1)
    appScriptBegin();
draw_surface_ext(application_surface, appX, appY, appXScale, appYScale, 0, c_white, 1);
if (appScriptEnd != -1)
    appScriptEnd();

gpu_set_blendenable(true);