#macro DEFAULT_INSTANCES_LAYER "Instances_1"

/**
 * With this function you can create a new instance of the specified object at any given point within the room on the configured default instances layer.
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
 * You call this function whenever you wish to safely "destroy" an instance, normally triggering a Destroy Event and also a Clean Up Event and preventing potential crashes if the given instance doesn't exist.
 * @parameter {Asset.GMObject|Id.Instance|Constant.All} id The instance ID to destroy, or the object asset to destroy instances of.
 * @parameter {Bool} Set to true or false to perform the Destroy event or not (optional, default is true)
 */
function InstanceDestroySafe(id, execute_event_flag = true)
{
    with (id)
        instance_destroy(self, execute_event_flag);
}