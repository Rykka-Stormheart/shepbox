/*
 * This script should set a point light on a lamp on or off.
 * Hopefully.
*/
default
{
    state_entry() // We're loaded!
    {
        vector COLOR_WHITE = <0.950, 0.950, 0.920>; // Defining what our color is for easier readability
        // Set the color below
        llSetLinkPrimitiveParams(
            LINK_ALL_CHILDREN,
            [ 
            PRIM_FULLBRIGHT, ALL_SIDES, TRUE,
            PRIM_POINT_LIGHT, TRUE, COLOR_WHITE, 1.0, 10.0, 0.750
            ]
            );
    }

    touch_end(integer total_number)
    {
        state off;
    }
}

// Now we're turning off the light.
state off
{
    state_entry() // We've just started turning off (entered the state)
    {
        llSetLinkPrimitiveParams(
            LINK_ALL_CHILDREN,
            [
            PRIM_FULLBRIGHT, ALL_SIDES,  FALSE,
            PRIM_POINT_LIGHT, FALSE, ZERO_VECTOR, 1.0, 10.0, 0.750
            ]
            );
    }
    touch_end(integer total_number)
    {
        state default;
    }
}