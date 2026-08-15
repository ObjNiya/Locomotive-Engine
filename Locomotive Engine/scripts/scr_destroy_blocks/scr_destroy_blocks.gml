/**
 * Destroys all blocks that the current instance has collided with based on the given position.
 * @parameter {Real} x The x position to check for blocks.
 * @parameter {Real} y The y position to check for blocks.
 * @parameter {Bool} horiz Whether or not to destroy blocks if they've been touched from their left and right sides.
 * @parameter {Bool} vert Whether or not to destroy blocks if they've been touched from their top and bottom sides.
 * @parameter {Array<Asset.GMObject>} excludes (OPTIONAL) Which types of blocks to not destroy. Default are none.
 */
function BlocksDestroy(x, y, horiz, vert, excludes = [])
{
    var block_list = ds_list_create();
    instance_place_list(x, y, obj_block, block_list, false);
    
    if (ds_list_empty(block_list))
    {
        ds_list_destroy(block_list);
        return false;
    }
    
    var blocks_destroyed = false;
    var block_count = ds_list_size(block_list);
    var i = 0;
    
    repeat (block_count) 
    {
        var block = ds_list_find_value(block_list, i);
        
        if (array_get_index(excludes, block.object_index) != -1)
        {
            i++;
            continue;
        }
        
        var bbox_xmid = bbox_left + ((bbox_right - bbox_left) / 2);
        var bbox_ymid = bbox_top + ((bbox_bottom - bbox_top) / 2);
        
        var block_bbox_xmid, block_bbox_ymid;
        with (block)
        { 
            block_bbox_xmid = bbox_left + ((bbox_right - bbox_left) / 2);
            block_bbox_ymid = bbox_top + ((bbox_bottom - bbox_top) / 2);
        }
        
        var angle_to_block = point_direction(bbox_xmid, bbox_ymid, block_bbox_xmid, block_bbox_ymid);
        
        if (horiz && (angle_to_block >= 315 && angle_to_block <= 360) || (angle_to_block >= 0 && angle_to_block <= 45) || (angle_to_block >= 135 && angle_to_block <= 225))
        {
            blocks_destroyed = true;
            instance_destroy(block);
        }
        else if (vert)
        {
            blocks_destroyed = true;
            instance_destroy(block);
        }
        
        i++;
    }
    
    return blocks_destroyed;
}