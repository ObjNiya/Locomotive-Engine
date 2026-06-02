with (obj_player)
{
    var tv = instance_create(845, 80, obj_hud_tv);
    tv.playerId = id;
    hudTvId = tv;
    
    with (tv)
        SmcSetState("Idle");
    
    var book = instance_create(5, 390, obj_hud_book);
    book.playerId = id;
    hudBookId = book;
}

queue_room(global.level.starting_rm, obj_spawn_a);
goto_room();