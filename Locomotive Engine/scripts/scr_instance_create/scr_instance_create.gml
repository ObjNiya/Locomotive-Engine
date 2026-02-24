/**
 * With this function you can create a new instance of the specified object at any given point within the room on the layer ```Instances_1```.
 * @parameter {Real} x The x position the object will be created at.
 * @parameter {Real} y The y position the object will be created at.
 * @parameter {Asset.GMObject} obj The object index of the object to create an instance of.
 * @parameter {Struct} var_struct (OPTIONAL) A struct with variables to assign to the new instance.
 * @returns {Id.Instance}
 */
function instance_create(x, y, obj, var_struct = {})
{
    with (instance_create_layer(x, y, "Instances_1", obj))
    {
        depth += layer_get_depth("Instances_1");
        return id;
    }
}