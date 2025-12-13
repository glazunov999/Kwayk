function inQuad(t)
{
    return t*t;
}

function outQuad(t)
{
    return -t*(t-2);
}

function inOutQuad(t) {
    t *= 2.0;
    if (t < 1) {
        return t * t / 2.0;
    } else {
        --t;
        return -0.5 * (t * (t - 2) - 1);
    }
}

function outInQuad(t)
{
    if (t < 0.5) return outQuad (t*2)/2;
    return inQuad((2*t)-1)/2 + 0.5;
}
