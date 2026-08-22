/**
 * Creates a Parallax Layer to be added with `PrlxCfgCommit()`.
 * @parameter {Real} x_prlx_factor The parallax factor on the x axis as a scalar. (0 = still, 1 = follows camera)
 * @parameter {Real} y_prlx_factor The parallax factor on the y axis as a scalar. (0 = still, 1 = follows camera)
 */
function PrlxLayer(x_prlx_factor, y_prlx_factor) constructor
{
    id = -1;
    depth = 0;
    x = 0;
    y = 0;
    
    onBgLay = -1;
    type = PRLX_CFG_TYPES.LAYER;
    fx = {};
    elements = [];

    rmEditrXOffset = 0;
    rmEditrYOffset = 0;
    rmEditrXScroll = 0;
    rmEditrYScroll = 0;
    rmEditrXSpeed = 0;
    rmEditrYSpeed = 0;
    
    surfMode = PRLX_LAYER.NO_SURF;
    surfId = -1;
    
    valueModifiers = {};

    // #region Setter functions
    
    
    /**
     * Sets the parallax factor for both axis.
     * @parameter {Real} x_prlx_factor The parallax factor on the x axis as a scalar. (0 = still, 1 = follows camera)
     * @parameter {Real} y_prlx_factor The parallax factor on the y axis as a scalar. (0 = still, 1 = follows camera)
     */
    static SetPrlx = function(x_prlx_factor, y_prlx_factor) /*=>*/
    {
        xPrlx = x_prlx_factor;
        yPrlx = y_prlx_factor;
        
        return self;
    }
    
    /**
     * Sets the Parallax Layer to be completely still on either given axis.
     * @parameter {Bool} x_still Whether or not to make the Parallax Layer still on the x axis.
     * @parameter {Bool} y_still Whether or not to make the Parallax Layer still on the y axis.
     */
    static SetStill = function(x_still, y_still)
    {
        xStill = x_still;
        yStill = y_still;
        
        return self;
    }
    
    /**
     * Sets the offset for both axis. (Stacks with the offsets of the layer that the Parallax Layer will be assigned to)
     * @parameter {Real} x_offset By how much to offset the Parallax Layer to the right.
     * @parameter {Real} y_offset By how much to offset the Parallax Layer to the bottom.
     */
    static SetOffset = function(x_offset, y_offset) /*=>*/
    {
        xOffset = x_offset;
        yOffset = y_offset;
        
        return self;
    }
    
    
    /**
     * Sets the scroll speed on both axis'. (Stacks with the original scroll of the layer that the Parallax Layer will be assigned to)
     * @parameter {Real|Asset.AnimCurve|Function} h_speed The horizontal scroll speed as a number, animation curve or function. If it's a function, the normalized horizontal scroll will be passed into the first argument).
     * @parameter {Real|Asset.AnimCurve|Function} v_speed The vertical scroll speed as a number, animation curve or function. If it's a function, the normalized vertical scroll will be passed into the first argument).
     */
    static SetScroll = function(h_speed, v_speed) /*=>*/
    {
        xScroll = new __Scroller__(h_speed);
        yScroll = new __Scroller__(v_speed);

        return self;
    }

    
    /**
     * Sets the colour and intensity of the depth fog.
     * @parameter {Constant.Colour} color The fog color
     * @parameter {Real} amount The intensity (As a scalar, so from 0 to 1)
     */
    static SetDepthFog = function(color, amount) /*=>*/
    {
        depthFogCol = color;
        depthFogAmnt = amount;
        
        return self;
    }

    
    /**
     * Sets the colour of the depth fog according to the given red, green and blue channels, as well as sets the intensity.
     * @parameter {Real} red The red component of the fog colour. (From 0 to 255)
     * @parameter {Real} green The green component of the fog colour. (From 0 to 255)
     * @parameter {Real} blue The blue component of the fog colour. (From 0 to 255)
     * @parameter {Real} amount The intensity (As a scalar, so from 0 to 1)
     */
    static SetDepthFogRgb = function(red, green, blue, amount)
    {
        SetDepthFog(make_color_rgb(red, green, blue), amount);
    }
    
    
    /**
     * Sets the colour of the depth fog according to the given hue, saturation and value channels, as well as sets the intensity.
     * @parameter {Real} hue The hue of the fog colour (From 0 to 255)
     * @parameter {Real} saturation How saturated the fog colour is (From 0 to 255)
     * @parameter {Real} value How dark the fog colour is (From 0 to 255)
     * @parameter {Real} amount The intensity (As a scalar, so from 0 to 1)
     */
    static SetDepthFogHsv = function(hue, saturation, value, amount)
    {
        SetDepthFog(make_color_hsv(hue, saturation, value), amount);
    }
    
    /**
     * Sets the scale and angle.
     * @parameter {Real} x_scale The horizontal scaling, as a multiplier: 1 = normal scaling, 0.5 is half, etc.
     * @parameter {Real} y_scale The vertical scaling, as a multiplier: 1 = normal scaling, 0.5 is half, etc.
     * @parameter {Real} rotation The rotation in degrees. 0 = right way up, 90 = rotated 90 degrees counter-clockwise, etc.
     */
    static SetTransform = function(x_scale, y_scale, rotation) /*=>*/
    {
        xScale = x_scale;
        yScale = y_scale;
        self.angle = rotation;
        
        return self;
    }

    
    /**
     * Sets the blending colour and alpha.
     * @parameter {Constant.Colour} colour The blending colour
     * @parameter {Real} alpha The alpha (As a scalar, so between 0 and 1)
     */
    static SetColour = function(colour, alpha) /*=>*/
    {
        blend = colour;
        self.alpha = alpha;
        
        return self;
    }
    
    
    /**
     * Sets the blending colour according to the given red, green and blue channels, as well as sets the alpha.
     * @parameter {Real} red The red component of the colour. (From 0 to 255)
     * @parameter {Real} green The green component of the colour. (From 0 to 255)
     * @parameter {Real} blue The blue component of the colour. (From 0 to 255)
     * @parameter {Real} alpha The alpha (As a scalar, so from 0 to 1)
     */
    static SetColourRgb = function(red, green, blue, alpha) /*=>*/
    {
        return SetColour(make_colour_rgb(red, green, blue), alpha);
    }
    
    
    /**
     * Sets the blending colour according to the given hue, saturation and value channels, as well as sets the alpha.
     * @parameter {Real} hue The hue of the colour (From 0 to 255)
     * @parameter {Real} saturation How saturated the colour is (From 0 to 255)
     * @parameter {Real} value How dark the colour is (From 0 to 255)
     * @parameter {Real} alpha The alpha (As a scalar, so from 0 to 1)
     */
    static SetColourHsv = function(hue, saturation, value, alpha) /*=>*/
    {
        return SetColour(make_colour_hsv(hue, saturation, value), alpha);
    }
    
    
    /**
     * Sets the blending color and alpha.
     * @parameter {Constant.Color} color The blending color
     * @parameter {Real} alpha The alpha (As a scalar, so between 0 and 1)
     */
    static SetColor = function(color, alpha) /*=>*/
    {
        return SetColour(color, alpha);
    }

    
    /**
     * Sets the blending color according to the given red, green and blue channels, as well as sets the alpha.
     * @parameter {Real} red The red component of the color. (From 0 to 255)
     * @parameter {Real} green The green component of the color. (From 0 to 255)
     * @parameter {Real} blue The blue component of the color. (From 0 to 255)
     * @parameter {Real} alpha The alpha (As a scalar, so from 0 to 1)
     */    
    static SetColorRgb = function(red, green, blue, alpha) /*=>*/
    {
        return SetColourRgb(red, green, blue, alpha);
    }

    
    /**
     * Sets the blending color according to the given hue, saturation and value channels, as well as sets the alpha.
     * @parameter {Real} hue The hue of the color (From 0 to 255)
     * @parameter {Real} saturation How saturated the color is (From 0 to 255)
     * @parameter {Real} value How dark the color is (From 0 to 255)
     * @parameter {Real} alpha The alpha (As a scalar, so from 0 to 1)
     */
    static SetColorHsv = function(hue, saturation, value, alpha) /*=>*/
    {
        return SetColourHsv(hue, saturation, value, alpha);
    }

    
    /**
     * Sets whether or not a new layer should be made if the layer that the Parallax Layer will be assigned to doesn't exist, as well as what to create on the layer.
     * @parameter {Bool} auto_create_enabled If a new layer should be created or not.
     * @parameter {Real} auto_create_depth The depth of the auto created layer.
     * @parameter {Function} auto_create_func What should be put on the auto created layer. (The ID of the auto created layer is passed in as the first argument of this function)
     */
    static SetAutoCreate = function(auto_create_enabled, auto_create_depth, auto_create_func) /*=>*/
    {
        autoCreate = [
            auto_create_enabled,
            auto_create_depth,
            auto_create_func
        ];
        
        return self;
    }
  
    
    /**
     * Sets functions that are called before and after drawing the Parallax Layer.
     * @parameter {Function} prefix The function to call before drawing the Parallax Layer.
     * @parameter {Function} postfix The function to call after drawing the Parallax Layer.
     */
    static SetDrawFuncs = function(prefix, postfix) /*=>*/
    {
        drawPrefix = prefix;
        drawPostfix = postfix;
        
        return self;
    }
    
    
    /**
     * Adds a modifier that scrolls and/or applies parallax to the given value.
     * @parameter {Real|Asset.AnimCurve|Function} speed The scroll speed as a number, animation curve or function. If it's a function, the normalized scroll will be passed into the first argument).
     * @parameter {String} prlx_axis Which axis to use the parallax value of. ("X" or "Y", no parallax will be applied if this argument is set to anything else)
     * @parameter {Real} prlx_multiplier By how much to multiply the parallax value of the previously given axis.
     * @parameter {String} value_name The name of the value. (Said value can be a member of the Parallax Layer or an Fx Parameter from the layer that the Parallax Layer will be assigned to)
     * @parameter {Real} array_value_index (OPTIONAL) The target array index of the given value if it's an array of real's. (Default = -1)
     * @parameter {Bool} value_is_fx_param (OPTIONAL) If the given value is an Fx Parameter or a member of the Parallax Layer. (Default = false)
     */
    static AddValueModifier = function(speed, prlx_axis, prlx_multiplier, value_name, array_value_index = -1, value_is_fx_param = false) /*=>*/
    {
        valueModifiers[$ value_name] = [
            new __Scroller__(speed),
            string_lower(prlx_axis),
            prlx_multiplier,
            value_name,
            array_value_index,
            value_is_fx_param
        ];
        
        return self;
    }
    
    
    /// @ignore
    static UpdateLayElements = function() /*=>*/
    {
        if (!layer_exists(id))
            return;
            
        if (array_length(elements) <= 0)
            return;
        
        array_foreach(elements, function(elem_dat, index) {
            var elem = elem_dat.elementID;
            var xscale = elem_dat.xScale ?? 1;
            var yscale = elem_dat.yScale ?? 1;
            var angle = elem_dat.angle ?? 0;
            var blend = elem_dat.blend ?? c_white;
            var alpha = elem_dat.alpha ?? 1;
            
            switch (layer_get_element_type(elem))
            {
                case layerelementtype_background:
                    layer_background_xscale(elem, xscale * other.xScale);
                    layer_background_yscale(elem, yscale * other.yScale);

                    if (blend == c_white)
                        layer_background_blend(elem, other.blend);
                    else
                        layer_background_blend(elem, merge_colour(blend, other.blend, 0.5));
                    
                    layer_background_alpha(elem, alpha * other.alpha);
                    break;
                    
                case layerelementtype_sequence:
                    layer_sequence_xscale(elem, xscale * other.xScale);
                    layer_sequence_yscale(elem, yscale * other.yScale);
                    layer_sequence_angle(elem, angle + other.angle);
                    break;
                    
                case layerelementtype_sprite:
                    layer_sprite_xscale(elem, xscale * other.xScale);
                    layer_sprite_yscale(elem, yscale * other.yScale);
                    
                    if (blend == c_white)
                        layer_sprite_blend(elem, other.blend);
                    else
                        layer_sprite_blend(elem, merge_colour(blend, other.blend, 0.5));
                        
                    layer_sprite_angle(elem, angle + other.angle);
                    layer_sprite_alpha(elem, alpha * other.alpha);
                    break;
                    
                case layerelementtype_text:
                    layer_text_xscale(elem, xscale * other.xScale);
                    layer_text_yscale(elem, yscale * other.yScale);
                    
                    if (blend == c_white)
                        layer_text_blend(elem, other.blend);
                    else
                        layer_text_blend(elem, merge_colour(blend, other.blend, 0.5));
                        
                    layer_text_angle(elem, angle + other.angle);
                    layer_text_alpha(elem, alpha * other.alpha);
                    break;
            }
        });
    }
    
    
    /// @ignore
    static ApplyDepthFog = function() /*=>*/
    {
        var depth_fog_red = color_get_red(depthFogCol) / 255;
        var depth_fog_green = color_get_green(depthFogCol) / 255;
        var depth_fog_blue = color_get_blue(depthFogCol) / 255;
        var depth_fog_amnt = depthFogAmnt;
        
        if (depth_fog_amnt <= 0)
            return;
                
        shader_set(shd_depth_fog);
        shader_set_uniform_f(shader_get_uniform(shd_depth_fog, "u_vDepthFog"), depth_fog_red, depth_fog_green, depth_fog_blue, depth_fog_amnt);
    }
    
    
    /// @ignore
    static Create = function(name) /*=>*/
    {
        id = layer_get_id(name);
        
        if (!layer_exists(id) && !autoCreate[PRLX_LAYER.AUTO_CREATE_ENABLE])
            return;
        else if (!layer_exists(id))
        {
            id = layer_create(autoCreate[PRLX_LAYER.AUTO_CREATE_DEPTH], name);
            autoCreate[PRLX_LAYER.AUTO_CREATE_FUNC](id);
        }
        
        depth = layer_get_depth(id);
        fx = layer_get_fx(id);
        
        rmEditrXOffset = layer_get_x(id);
        rmEditrYOffset = layer_get_y(id);
        rmEditrXSpeed = layer_get_hspeed(id);
        rmEditrYSpeed = layer_get_vspeed(id);
        
        var lay_elems = layer_get_all_elements(id);

        array_foreach(lay_elems, function(elem, index) {
            var elem_type = layer_get_element_type(elem);
            
            if (elem_type == layerelementtype_background && onBgLay == -1)
                onBgLay = elem;
            
            var tilemap_lay_surf = ((elem_type == layerelementtype_tilemap || elem_type == layerelementtype_oldtilemap) && (other.xScale != 1 || other.yScale != 1 || other.blend != c_white || other.alpha != 1));
            var sequence_lay_surf = ((elem_type == layerelementtype_sequence) && (other.blend != c_white || other.alpha != -1));
    
            if (tilemap_lay_surf || sequence_lay_surf)
                other.surfMode = PRLX_LAYER.CAM_SIZED_SURF;
                
            var instance_lay_surf = (elem_type == layerelementtype_instance && layer_instance_get_instance(elem_type).depth == other.depth && AUTO_MANAGE_INSTANCE_LAYERS);
            var part_system_lay_surf = (elem_type == layerelementtype_particlesystem);
            var text_lay_surf = (elem_type == layerelementtype_text && (other.xPrlx != 1 || other.yPrlx != 1));
    
            if (instance_lay_surf || part_system_lay_surf || text_lay_surf)
                other.surfMode = PRLX_LAYER.ROOM_SIZED_SURF;
                
            if (other.surfMode != PRLX_LAYER.NO_SURF)
                other.elements = [];
            else
                array_push(other.elements, new __LayerelementData__(elem));
        });
        
         
        layer_script_begin(id, function() {
            if (surfMode == PRLX_LAYER.NO_SURF || event_type != ev_draw || event_number != ev_draw_normal)
            {
                ApplyDepthFog();
                
                if (drawPrefix != -1)
                    drawPrefix();
                exit;
            }
            
            var surf_width = global.prlxData.biggestCamW;
            var surf_height = global.prlxData.biggestCamH;
            
            if (surfMode == PRLX_LAYER.ROOM_SIZED_SURF)
            {
                surf_width = room_width;
                surf_height = room_height;
            }
            
            if (!surface_exists(surfId))
                surfId = surface_create(surf_width, surf_height);
            else if (surface_get_width(surfId) < surf_width || surface_get_height(surfId) < surf_height)
                surface_resize(surfId, surf_width, surf_height);
            
            if (surface_get_target() != surfId)  
            {
                surface_set_target(surfId);
                draw_clear_alpha(c_black, 0);
            }
        });
        
        layer_script_end(id, function() {
            if (surfMode == PRLX_LAYER.NO_SURF || !surface_exists(surfId) || event_type != ev_draw || event_number != ev_draw_normal)
            {
                if (shader_current() == shd_depth_fog)
                    shader_reset();
            
                if (drawPostfix != -1)
                    drawPostfix();
                exit;
            }   
            
            if (surface_get_target() == surfId)
                surface_reset_target();
            
            var surf_x = x;
            var surf_y = y;
            
            if (surfMode == PRLX_LAYER.CAM_SIZED_SURF)
            {
                var cam = view_camera[view_current];
                 
                surf_x = camera_get_view_x(cam);
                surf_y = camera_get_view_y(cam);
            }
            
            if (drawPrefix != -1)
                drawPrefix();
                
            if (layer_get_visible(id))
            {
                ApplyDepthFog();
                draw_surface_ext(surfId, surf_x, surf_y, xScale, yScale, angle, blend, alpha);
            }
            
            if (shader_current() == shd_depth_fog)
                shader_reset();
            
            if (drawPostfix != -1)
                drawPostfix();
        });
        
        if (surfMode != PRLX_LAYER.NO_SURF)
            return;
        
        if (surface_exists(surfId))
        {
            surface_free(surfId);
            surfId = -1;
        }
                
        UpdateLayElements();
    }
    
    
    /// @ignore
    static Reset = function() /*=>*/
    {
        id = -1;
        depth = 0;
        x = 0;
        y = 0;
        
        rmEditrXOffset = 0;
        rmEditrYOffset = 0;
        rmEditrXScroll = 0;
        rmEditrYScroll = 0;
        rmEditrXSpeed = 0;
        rmEditrYSpeed = 0;
        
        xScroll.pos = 0;
        yScroll.pos = 0;
        
        elements = [];
        onBgLay = -1;
    }
    
    
    /// @ignore
    static Step = function(camera_index) /*=>*/
    {
        if (id == -1)
            return;
        
        var cam;
        
        if (is_real(camera_index))
            cam = view_camera[camera_index];
        else
            cam = camera_index;
        
        rmEditrXScroll += rmEditrXSpeed;
        rmEditrYScroll += rmEditrYSpeed;
        
        xScroll.Step();
        yScroll.Step();
        
        var cam_x = camera_get_view_x(cam);
        var cam_y = camera_get_view_y(cam);
        
        if (onBgLay != -1)
        {
            var bg_spr = layer_background_get_sprite(onBgLay);
            if (bg_spr == -1)
                onBgLay = -1;
        }
        
        if (!xStill)
        {
            var base_x = (rmEditrXOffset + rmEditrXScroll + xOffset + xScroll.pos);
            var prlx_x = (cam_x * xPrlx);
            x = base_x + prlx_x;
        }
        else if (onBgLay != -1)
        {
            var cam_w = camera_get_view_width(cam);
            var cam_x_scalar = cam_x / (room_width - cam_w);
            
            var bg_spr_xorigin = sprite_get_xoffset(bg_spr);
            var max_bg_x = sprite_get_width(bg_spr) - cam_w;
            max_bg_x = max(max_bg_x, 0);
            
            x = cam_x - bg_spr_xorigin - lerp(0, max_bg_x, cam_x_scalar);
        }
        else
            x = cam_x;
        
        if (!yStill)
        {
            var base_y = (rmEditrYOffset + rmEditrYScroll + yOffset + yScroll.pos);
            var prlx_y = (cam_y * yPrlx);
            y = base_y + prlx_y;
        }
        else if (onBgLay != -1)
        {
            var cam_h = camera_get_view_height(cam);
            var cam_y_scalar = cam_y / (room_height - cam_h);
            
            var bg_spr_yorigin = sprite_get_yoffset(bg_spr);
            var max_bg_y = sprite_get_height(bg_spr) - cam_h;
            max_bg_y = max(max_bg_y, 0);
            
            y = cam_y - bg_spr_yorigin - lerp(0, max_bg_y, cam_y_scalar);
        }
        else
            y = cam_y;
        
        var lay_x = x;
        var lay_y = y;
        
        if (surfMode == PRLX_LAYER.CAM_SIZED_SURF)
        {
            lay_x -= camera_get_view_x(cam);
            lay_y -= camera_get_view_y(cam);
        }
        else if (surfMode == PRLX_LAYER.ROOM_SIZED_SURF)
        {
            lay_x = 0;
            lay_y = 0;
        }
        
        layer_x(id, lay_x);
        layer_y(id, lay_y);

        struct_foreach(valueModifiers, method( { cam_index: cam }, function(name, value) { // I will kill myself
            var val_scroller = value[PRLX_LAYER.VAL_MOD_SCROLLER];
            var val_prlx_axis = value[PRLX_LAYER.VAL_MOD_PRLX_AXIS];
            var val_prlx_mult = value[PRLX_LAYER.VAL_MOD_PRLX_MULT];
            var val_name = value[PRLX_LAYER.VAL_MOD_VAL_NAME];
            var arr_val_index = value[PRLX_LAYER.VAL_MOD_ARR_VAL_INDEX];
            var val_is_fx_param = value[PRLX_LAYER.VAL_MOD_IS_FX_PARAM];
        
            val_scroller.Step();
            
            var cam = view_camera[cam_index];
            var prlx;
            
            switch (val_prlx_axis)
            {
                case "x":
                    prlx = camera_get_view_x(cam) * other.xPrlx;
                    break;
                
                case "y":
                    prlx = camera_get_view_y(cam) * other.yPrlx;
                    break;
                    
                default:
                    prlx = 0;
                    break;
            }
            
            prlx *= val_prlx_mult;
            
            if (val_is_fx_param && is_struct(other.fx))
            {
                var fx_param = fx_get_parameter(other.fx, val_name);
                
                if (!is_array(fx_param))
                    fx_param = val_scroller.pos + prlx;
                else
                {
                    value[PRLX_LAYER.VAL_MOD_ARR_VAL_INDEX] = clamp(arr_val_index, 0, array_length(fx_param) - 1);
                    fx_param[arr_val_index] = val_scroller.pos + prlx;
                }
                    
                fx_set_parameter(other.fx, val_name, fx_param);
                layer_set_fx(other.id, other.fx);
                return;
            }
            
            var val = other[$ val_name];
            
            if (!is_array(val))
                other[$ val_name] = val_scroller.pos + prlx;
            else
            {
                value[PRLX_LAYER.VAL_MOD_ARR_VAL_INDEX] = clamp(arr_val_index, 0, array_length(val) - 1);
                other[$ val_name][arr_val_index] = val_scroller.pos + prlx;
            }
        }));
        
        if (surfMode != PRLX_LAYER.NO_SURF)
            return;
    
        UpdateLayElements();
    }
    
    SetDepthFog(PrlxCfgDepthFogGetCol(), 0);
    SetPrlx(x_prlx_factor, y_prlx_factor);
    SetStill(false, false);
    SetScroll(0, 0);
    SetDrawFuncs(-1, -1);
    SetOffset(0, 0);
    SetTransform(1, 1, 0);
    SetColor(c_white, 1);
    SetAutoCreate(false, 0, -1);
    
    return self;
}