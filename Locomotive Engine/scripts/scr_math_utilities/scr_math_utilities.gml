function side(n, fallback)
{
    return (sign(n) == 0) ? fallback : n;
}

function approach(a, b, amt)
{
    return a + clamp(b - a, -amt, amt);
}