default // Default/Mandatory. This is ALWAYS run on first-load/when we're spawned.
{
    state_entry() // When we enter this state, do the following. We then sit in this state until an interaction is called.
    {
        llOwnerSay("Turning on the light!"); // Barky noises! Uses channel 0, hence the 0.
        llSetColor(<1.0, 1.0, 1.0>, ALL_SIDES); // RGB values, what faces to set it on. Sets no tint (white)
    }
    
    // We cannot use touch_start when changing states, for some reason?
    touch_end(integer total_number)
    {
        state off; // Tell the script to go to a new state and runs state off
    }
}

state off // Our state when turned off
{
    state_entry() // The first thing we do as soon as we enter the off state
    {
        llOwnerSay("Turning off now!");
        llSetColor(<0.0, 0.0, 0.0>, ALL_SIDES); // RGB values, what faces to set it on. Sets black tint (0,0,0)
    }

    touch_end(integer total_number)
    {
        state default;
    }
}