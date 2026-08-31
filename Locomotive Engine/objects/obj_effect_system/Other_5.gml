if (ArrayIsEmpty(effects))
    exit;

// This retarded faggot tranny engine thinks theres objects in this array because the fucking STRUCT REFERENCE MATCHES OBJECT IDS, so i have to check is_struct
array_foreach(effects, function(effect, index) {
    if (is_struct(effect))
        effect.Destroy();
});