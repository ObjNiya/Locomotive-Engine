function approach(a, b, amt)
{
    return a + clamp(b - a, -amt, amt);
}