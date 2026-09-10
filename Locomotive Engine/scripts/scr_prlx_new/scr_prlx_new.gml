enum PRLX_LAY_TYPES
{
    BG,
    TILES,
    EFFECT,
    MULTI,
}

global.__prlx__ = {
    cfg: ds_map_create(),
    lay: ds_map_create()
}

/// @ignore
function PrlxLayCfg() constructor 
{
    static PrlxSet = function(x_prlx, y_prlx)
    {
        xPrlx = x_prlx;
        yPrlx = y_prlx;
        
        return self;
    }
    
    
    static DepthFogSet = function(color, amount)
    {
        depthFogCol = color;
        depthFogAmnt = amount;
        
        return self;
    }
    
    
    static ScaleSet = function(x_scale, y_scale)
    {
        xScale = x_scale;
        yScale = y_scale;
        
        return self;
    }
    
    
    static StillSet = function(x_still, y_still)
    {
        xStill = x_still;
        yStill = y_still;
        
        return self;
    }
    
    
    PrlxSet(0, 0);
    DepthFogSet(c_white, 0);
    ScaleSet(1, 1);
    StillSet(false, false);
    
    return self;
}


function PrlxCfgLay(accessor, x_prlx, y_prlx, x_still, y_still)
{
    var cfg = new PrlxlayCfg();
    cfg.PrlxSet(x_prlx, y_prlx).StillSet(x_still, y_still);
    
    
    global.__prlx__.cfg[? accessor] = cfg;
}


function PrlxLay(cfg_key, lay_id) constructor 
{
    cfgKey = -1;
    layId = -1;
    type = -1;
    
    hspd = 0;
    vspd = 0;
    
    xScroll = 0;
    yScroll = 0;
    
    xStillOffset = 0;
    yStillOffset = 0;
    
    useSurf = 0;
    
    static StillOffsetSet = function(lay_type)
    {
        switch (lay_type)
        {
            case PRLX_LAY_TYPES.BG:
                var bg_spr = layer_background_get_id(layId);
                bg_spr = layer_background_get_sprite(bg_spr);
                
                xStillOffset = sprite_get_xoffset(bg_spr);
                yStillOffset = sprite_get_yoffset(bg_spr);
                break;
            
            case PRLX_LAY_TYPES.TILES:
                var tilemap = layer_tilemap_get_id(layId);
                
                xStillOffset = tilemap_get_x(tilemap);
                yStillOffset = tilemap_get_y(tilemap);
                break;
            
            case PRLX_LAY_TYPES.EFFECT:
                show_debug_message("[PARALLAX ERROR] Invalid layer type: Effects");
                break;
            
            case PRLX_LAY_TYPES.MULTI:
                var min_x = 0, min_y = 0;
                var i = 0;
                
                var elements = layer_get_all_elements(layId);
                var elem_count = array_length(elements);
                
                repeat (elem_count)
                {
                    var elem_type = layer_get_element_type(elements[i]);
                    
                    switch (elem_type)
                    {
                        case layerelementtype_background:
                            StillOffsetSet(PRLX_LAY_TYPES.BG);
                            break;
                        
                        case layerelementtype_oldtilemap:
                        case layerelementtype_tilemap:
                            StillOffsetSet(PRLX_LAY_TYPES.TILES);
                            break;
                        
                    } 
                    
                    if (min_x < xStillOffset)
                        min_x = xStillOffset;
                    if (min_y < yStillOffset)
                        min_y = yStillOffset;
                    
                    i++;                                
                }
                
                xStillOffset = min_x;
                yStillOffset = min_y;
                
                
        }
    }
    
    /// @ignore
    static Create = function()
    {
        hspd = layer_get_hspeed(layId);
        vspd = layer_get_vspeed(layId);
        
        var elems = layer_get_all_elements(layId);
  
        if (array_length(elems) <= 1)
        {
            var bg = layer_background_get_id(layId);
            var tilemap = layer_tilemap_get_id(layId);
            var fx = layer_get_fx(layId);
            
            if (bg != -1)
                type = PRLX_LAY_TYPES.BG;
            else if (tilemap != -1)
                type = PRLX_LAY_TYPES.TILES;
            else if (fx != -1)
                type = PRLX_LAY_TYPES.EFFECT;
        }
        else
            type = PRLX_LAY_TYPES.MULTI;
        
    }
}