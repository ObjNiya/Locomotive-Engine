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