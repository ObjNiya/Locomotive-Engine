if (!drawOnGui)
    exit;

drawScreen();
if (drawFunc != -1)
    drawFunc(getLoadProgress());