var sprite_count = array_length(sprites);

for (var i = 0; i < sprite_count; i++)
{
    var sprite = sprites[i];

    sprite.step();
    
    /*if (!instance_exists(sprite.parent))
    {
        array_delete(sprites, i, 1);
        i = 0;
    }*/
}