SmcRunEvent("Step");

var _spd = 15;

if (playerId.x > (room_width - 224) && playerId.y < 187)
    yOffset = Approach(yOffset, -220, _spd);
else
    yOffset = Approach(yOffset, 80, _spd);

comboFill = time_source_get_time_remaining(global.comboTimer);

with (comboBar)
{
	xOffset = sin(((current_time * 0.001) / 2) * (pi * 2))  * 5; // Because there isn't any 'wave' function, it has to be done like this. Thanks shaggy.
	
	if (global.combo > 0)
		count = global.combo; // Placeholder for when an actual combo system is implemented.
	
	switch (state)
	{
		case "Hide":
			yOffset = Approach(yOffset, -379, 5);
			
			if (global.combo > 0)
			{
				state = "Fall";
				vsp = -1;
			}
			break;
		case "Fall":
			yOffset += vsp;
			
            vsp += 0.5; // Gravityyyyy nooooooooo
			
            if (yOffset > 141)
                state = "Idle";
			break;
		case "Idle":
			yOffset = lerp(yOffset, 121, 0.05);
			
			if global.combo <= 0
				state = "Hide";
			break;
	}
}