var shell_open = (instance_exists(obj_shell) && obj_shell.isOpen);

if (global.canPause && !global.gamePaused && InputPressed(INPUT_VERB.PAUSE) && !shell_open)
    GamePause(true);
