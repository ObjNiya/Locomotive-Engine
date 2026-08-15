

var target_delta = 1 / 60;
var actual_delta = delta_time / 1000000;

global.deltaTime = (actual_delta / target_delta) * global.timeScale;

var shell_open = (instance_exists(obj_shell) && obj_shell.isOpen);

if (global.canPause && !global.gamePaused && InputPressed(INPUT_VERB.PAUSE) && !shell_open)
    GamePause(true);
