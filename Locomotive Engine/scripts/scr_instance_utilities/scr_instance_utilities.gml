/**
 * What layer instances created with ```InstanceCreate()``` will be placed on.
 */
#macro DEFAULT_INSTANCES_LAYER "Instances_1"


/**
 * Creates a new instance of the given object at the given point in the room on the default instances layer.
 * @parameter {Real} x The x position the object will be created at.
 * @parameter {Real} y The y position the object will be created at.
 * @parameter {Asset.GMObject} obj The object index of the object to create an instance of.
 * @parameter {Struct} var_struct (OPTIONAL) A struct with variables to assign to the new instance.
 * @returns {Id.Instance}
 */
function InstanceCreate(x, y, obj, var_struct = {})
{
    with (instance_create_layer(x, y, DEFAULT_INSTANCES_LAYER, obj, var_struct))
        return id;
}


/**
 * Destroys the given instance or object "safely" by preventing a crash if said instance/object didn't exist.
 * @parameter {Asset.GMObject|Id.Instance|Constant.All} id The instance ID to destroy, or the object asset to destroy instances of.
 * @parameter {Bool} Set to true or false to perform the Destroy event or not (optional, default is true)
 */
function InstanceDestroySafe(id, execute_event_flag = true)
{
    with (id)
        instance_destroy(self, execute_event_flag);
}