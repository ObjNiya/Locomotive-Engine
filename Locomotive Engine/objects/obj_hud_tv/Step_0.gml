exprTimer.Step();
SmcRunEvent(STATE_EVENTS.STEP);

if (playerId.x > (room_width - 224) && playerId.y < 187)
    y = approach(y, ystart - 300, 15);
else
    y = approach(y, ystart, 15);