SINGLETON;

asset_clear_tags(object_index, asset_object);

if (room != rm_titlecard)
    instance_destroy();

titlecard_title = layer_sprite_get_id("Assets_Titlecard_Title", "graphic_109DC63C");
titlecard_time = 120;