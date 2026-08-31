hud_pointsbook_add_collect_effect(value);
PointsNumberCreate(value);
sound_instance_one_shot(eventPath, x, y);
SaveroomAdd();
instance_destroy();