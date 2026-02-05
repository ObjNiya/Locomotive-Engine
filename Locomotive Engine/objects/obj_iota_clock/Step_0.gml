/////////////////////////////
// Update momentary inputs
/////////////////////////////

for (var i = 0; i < momentary_input_count; i++)
{
    var value = (i % 2 > 0) ? InputReleased(momentary_inputs[i][1]) : InputPressed(momentary_inputs[i][1]);
    
    global.clock.SetInput(momentary_inputs[i][0], value);
}

global.clock.Update();