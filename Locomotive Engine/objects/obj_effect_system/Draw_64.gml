if (!gui || ArrayIsEmpty(effects))
    exit;

array_foreach(effects, function(effect, index) {
    effect.Draw();
});