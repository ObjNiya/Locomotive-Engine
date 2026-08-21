SmcRunEvent("Step");

var _spd = 15;

if (playerId.x > (room_width - 224) && playerId.y < 187)
    yOffset = Approach(yOffset, -220, _spd);
else
    yOffset = Approach(yOffset, 80, _spd);

whitenoise.Step();
