hurtSysInit();

active = true;
owner = noone;

xOffset = 0;
yOffset = 0;
xScaleMult = 1;
yScaleMult = 1;
angleOffset = 0;

targets = {};

function Target(name, object, attack_function) constructor
{
    obj = object;
    attackFunc = attack_function;

    struct_set(other.targets, name, self);
}