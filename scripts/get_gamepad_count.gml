if (!gamepad_is_supported())
    return 0;
var max_count = gamepad_get_device_count();
for (var i=0;i<max_count;i++) {
    if (!gamepad_is_connected(i))
        return i;
}
return 0;
