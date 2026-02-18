function approach(a, b, amt)
{
    return a + clamp(b - a, -amt, amt);
}

function side(n, fallback)
{
    return (sign(n) == 0) ? fallback : n;
}

function bsign(boolean)
{
    return (!boolean) ? -1 : 1;
}

function get_lerp_number(_start,_end,_pct)
{
	//i cant remember if i may be absoloutely fucking stupid for this but idk
	return (_end - _start) * _pct
}
