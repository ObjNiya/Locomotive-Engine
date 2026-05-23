// Common

typedef int int32;
typedef unsigned long long uint64;

// Partial declaration with no functions (so we can pass it along)
struct gmval_c {
    uint64 _v;
};

typedef gmval_c (*CronusFunc_c)(gmval_c self, gmval_c callee, int argc, gmval_c* args);

// SharedLibraryManager

extern "C" void* SharedLibraryManager_GetFunctionByIndex(int index);
extern "C" int SharedLibraryManager_GetFunctionIndex(const char* libName, const char* functionName);

// GMVal Coerce

extern "C" double gmval_CoerceReal(gmval_c val);
extern "C" const char* gmval_CoerceCString(gmval_c val);;

// GMVal From

extern "C" gmval_c gmval_FromDouble(double d);
extern "C" gmval_c gmval_FromString(const char* s);

extern "C" gmval_c gmval_undefined();

// RunnerInterface

extern "C" void RunnerInterface_AddFunction(const char* name, CronusFunc_c func, int argc);
extern "C" void RunnerInterface_AddConstant_Double(const char* name, double value);
extern "C" void RunnerInterface_AddConstant_String(const char* name, const char* value);
extern "C" void RunnerInterface_ArgCountError(const char* funcName, int argc, int expected);

#include "FMOD_Module_Stubs.h"

extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_set_frequency(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_set_frequency", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_set_frequency");
    FunctionPtr fmod_channel_set_frequency = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_set_frequency == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_set_frequency(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_frequency(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_get_frequency", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_frequency");
    FunctionPtr fmod_channel_get_frequency = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_frequency == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_frequency(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_set_priority(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_set_priority", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_set_priority");
    FunctionPtr fmod_channel_set_priority = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_set_priority == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_set_priority(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_priority(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_get_priority", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_priority");
    FunctionPtr fmod_channel_get_priority = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_priority == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_priority(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_set_position(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_channel_set_position", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_set_position");
    FunctionPtr fmod_channel_set_position = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_set_position == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_set_position(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_position(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_get_position", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_position");
    FunctionPtr fmod_channel_get_position = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_position == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_position(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_set_channel_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_set_channel_group", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_set_channel_group");
    FunctionPtr fmod_channel_set_channel_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_set_channel_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_set_channel_group(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_channel_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_get_channel_group", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_channel_group");
    FunctionPtr fmod_channel_get_channel_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_channel_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_channel_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_set_loop_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_set_loop_count", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_set_loop_count");
    FunctionPtr fmod_channel_set_loop_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_set_loop_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_set_loop_count(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_loop_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_get_loop_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_loop_count");
    FunctionPtr fmod_channel_get_loop_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_loop_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_loop_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_set_loop_points(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 5)
        RunnerInterface_ArgCountError("fmod_channel_set_loop_points", argc, 5);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    double arg4;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    arg4 = gmval_CoerceReal(args[4]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_set_loop_points");
    FunctionPtr fmod_channel_set_loop_points = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_set_loop_points == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_set_loop_points(arg0, arg1, arg2, arg3, arg4);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_loop_points_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_channel_get_loop_points_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    const char* arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceCString(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_loop_points_multiplatform");
    FunctionPtr fmod_channel_get_loop_points_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_loop_points_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_loop_points_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_is_virtual(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_is_virtual", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_is_virtual");
    FunctionPtr fmod_channel_is_virtual = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_is_virtual == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_is_virtual(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_current_sound(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_get_current_sound", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_current_sound");
    FunctionPtr fmod_channel_get_current_sound = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_current_sound == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_current_sound(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_index(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_get_index", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_index");
    FunctionPtr fmod_channel_get_index = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_index == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_index(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_get_system_object(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_get_system_object", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_get_system_object");
    FunctionPtr fmod_channel_get_system_object = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_get_system_object == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_get_system_object(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_is_playing(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_is_playing", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_is_playing");
    FunctionPtr fmod_channel_control_is_playing = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_is_playing == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_is_playing(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_stop(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_stop", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_stop");
    FunctionPtr fmod_channel_control_stop = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_stop == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_stop(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_paused(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_paused", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_paused");
    FunctionPtr fmod_channel_control_set_paused = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_paused == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_paused(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_paused(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_paused", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_paused");
    FunctionPtr fmod_channel_control_get_paused = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_paused == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_paused(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_mode(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_mode", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_mode");
    FunctionPtr fmod_channel_control_set_mode = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_mode == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_mode(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_mode(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_mode", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_mode");
    FunctionPtr fmod_channel_control_get_mode = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_mode == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_mode(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_pitch(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_pitch", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_pitch");
    FunctionPtr fmod_channel_control_set_pitch = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_pitch == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_pitch(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_pitch(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_pitch", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_pitch");
    FunctionPtr fmod_channel_control_get_pitch = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_pitch == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_pitch(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_audibility(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_audibility", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_audibility");
    FunctionPtr fmod_channel_control_get_audibility = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_audibility == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_audibility(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_volume", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_volume");
    FunctionPtr fmod_channel_control_set_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_volume(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_volume", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_volume");
    FunctionPtr fmod_channel_control_get_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_volume(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_volume_ramp(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_volume_ramp", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_volume_ramp");
    FunctionPtr fmod_channel_control_set_volume_ramp = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_volume_ramp == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_volume_ramp(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_volume_ramp(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_volume_ramp", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_volume_ramp");
    FunctionPtr fmod_channel_control_get_volume_ramp = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_volume_ramp == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_volume_ramp(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_mute(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_mute", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_mute");
    FunctionPtr fmod_channel_control_set_mute = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_mute == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_mute(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_mute(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_mute", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_mute");
    FunctionPtr fmod_channel_control_get_mute = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_mute == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_mute(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_attributes_multiplatform");
    FunctionPtr fmod_channel_control_set_3d_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_attributes_multiplatform");
    FunctionPtr fmod_channel_control_get_3d_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_cone_orientation_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_cone_orientation_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_cone_orientation_multiplatform");
    FunctionPtr fmod_channel_control_set_3d_cone_orientation_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_cone_orientation_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_cone_orientation_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_cone_orientation_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_cone_orientation_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_cone_orientation_multiplatform");
    FunctionPtr fmod_channel_control_get_3d_cone_orientation_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_cone_orientation_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_cone_orientation_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_cone_settings(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_cone_settings", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_cone_settings");
    FunctionPtr fmod_channel_control_set_3d_cone_settings = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_cone_settings == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_cone_settings(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_cone_settings_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_cone_settings_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_cone_settings_multiplatform");
    FunctionPtr fmod_channel_control_get_3d_cone_settings_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_cone_settings_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_cone_settings_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_custom_rolloff_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_custom_rolloff_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_custom_rolloff_multiplatform");
    FunctionPtr fmod_channel_control_set_3d_custom_rolloff_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_custom_rolloff_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_custom_rolloff_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_custom_rolloff_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_custom_rolloff_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_custom_rolloff_multiplatform");
    FunctionPtr fmod_channel_control_get_3d_custom_rolloff_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_custom_rolloff_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_custom_rolloff_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_distance_filter(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_distance_filter", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_distance_filter");
    FunctionPtr fmod_channel_control_set_3d_distance_filter = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_distance_filter == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_distance_filter(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_distance_filter_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_distance_filter_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_distance_filter_multiplatform");
    FunctionPtr fmod_channel_control_get_3d_distance_filter_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_distance_filter_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_distance_filter_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_doppler_level(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_doppler_level", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_doppler_level");
    FunctionPtr fmod_channel_control_set_3d_doppler_level = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_doppler_level == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_doppler_level(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_doppler_level(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_doppler_level", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_doppler_level");
    FunctionPtr fmod_channel_control_get_3d_doppler_level = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_doppler_level == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_doppler_level(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_level(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_level", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_level");
    FunctionPtr fmod_channel_control_set_3d_level = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_level == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_level(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_level(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_level", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_level");
    FunctionPtr fmod_channel_control_get_3d_level = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_level == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_level(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_min_max_distance(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_min_max_distance", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_min_max_distance");
    FunctionPtr fmod_channel_control_set_3d_min_max_distance = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_min_max_distance == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_min_max_distance(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_min_max_distance_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_min_max_distance_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_min_max_distance_multiplatform");
    FunctionPtr fmod_channel_control_get_3d_min_max_distance_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_min_max_distance_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_min_max_distance_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_occlusion(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_occlusion", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_occlusion");
    FunctionPtr fmod_channel_control_set_3d_occlusion = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_occlusion == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_occlusion(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_occlusion_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_occlusion_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_occlusion_multiplatform");
    FunctionPtr fmod_channel_control_get_3d_occlusion_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_occlusion_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_occlusion_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_spread(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_3d_spread", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_3d_spread");
    FunctionPtr fmod_channel_control_set_3d_spread = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_3d_spread == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_3d_spread(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_spread(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_3d_spread", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_3d_spread");
    FunctionPtr fmod_channel_control_get_3d_spread = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_3d_spread == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_3d_spread(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_pan(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_pan", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_pan");
    FunctionPtr fmod_channel_control_set_pan = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_pan == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_pan(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_mix_levels_input_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_mix_levels_input_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_mix_levels_input_multiplatform");
    FunctionPtr fmod_channel_control_set_mix_levels_input_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_mix_levels_input_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_mix_levels_input_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_mix_levels_output(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 9)
        RunnerInterface_ArgCountError("fmod_channel_control_set_mix_levels_output", argc, 9);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    double arg4;
    double arg5;
    double arg6;
    double arg7;
    double arg8;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    arg4 = gmval_CoerceReal(args[4]);
    arg5 = gmval_CoerceReal(args[5]);
    arg6 = gmval_CoerceReal(args[6]);
    arg7 = gmval_CoerceReal(args[7]);
    arg8 = gmval_CoerceReal(args[8]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double, double, double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_mix_levels_output");
    FunctionPtr fmod_channel_control_set_mix_levels_output = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_mix_levels_output == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_mix_levels_output(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_mix_matrix_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_mix_matrix_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_mix_matrix_multiplatform");
    FunctionPtr fmod_channel_control_set_mix_matrix_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_mix_matrix_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_mix_matrix_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_mix_matrix_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_channel_control_get_mix_matrix_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_mix_matrix_multiplatform");
    FunctionPtr fmod_channel_control_get_mix_matrix_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_mix_matrix_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_mix_matrix_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_reverb_properties(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_channel_control_set_reverb_properties", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_reverb_properties");
    FunctionPtr fmod_channel_control_set_reverb_properties = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_reverb_properties == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_reverb_properties(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_reverb_properties(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_reverb_properties", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_reverb_properties");
    FunctionPtr fmod_channel_control_get_reverb_properties = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_reverb_properties == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_reverb_properties(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_low_pass_gain(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_low_pass_gain", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_low_pass_gain");
    FunctionPtr fmod_channel_control_set_low_pass_gain = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_low_pass_gain == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_low_pass_gain(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_low_pass_gain(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_low_pass_gain", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_low_pass_gain");
    FunctionPtr fmod_channel_control_get_low_pass_gain = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_low_pass_gain == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_low_pass_gain(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_add_dsp(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_channel_control_add_dsp", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_add_dsp");
    FunctionPtr fmod_channel_control_add_dsp = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_add_dsp == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_add_dsp(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_remove_dsp(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_remove_dsp", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_remove_dsp");
    FunctionPtr fmod_channel_control_remove_dsp = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_remove_dsp == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_remove_dsp(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_num_dsps(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_num_dsps", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_num_dsps");
    FunctionPtr fmod_channel_control_get_num_dsps = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_num_dsps == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_num_dsps(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_dsp(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_dsp", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_dsp");
    FunctionPtr fmod_channel_control_get_dsp = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_dsp == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_dsp(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_dsp_index(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_channel_control_set_dsp_index", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_dsp_index");
    FunctionPtr fmod_channel_control_set_dsp_index = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_dsp_index == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_dsp_index(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_dsp_index(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_dsp_index", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_dsp_index");
    FunctionPtr fmod_channel_control_get_dsp_index = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_dsp_index == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_dsp_index(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_dsp_clock_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_dsp_clock_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_dsp_clock_multiplatform");
    FunctionPtr fmod_channel_control_get_dsp_clock_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_dsp_clock_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_dsp_clock_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_delay_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_delay_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_delay_multiplatform");
    FunctionPtr fmod_channel_control_set_delay_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_delay_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_delay_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_delay_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_delay_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_delay_multiplatform");
    FunctionPtr fmod_channel_control_get_delay_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_delay_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_delay_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_add_fade_point_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_add_fade_point_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_add_fade_point_multiplatform");
    FunctionPtr fmod_channel_control_add_fade_point_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_add_fade_point_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_add_fade_point_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_fade_point_ramp_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_fade_point_ramp_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_fade_point_ramp_multiplatform");
    FunctionPtr fmod_channel_control_set_fade_point_ramp_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_fade_point_ramp_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_fade_point_ramp_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_remove_fade_points_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_remove_fade_points_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_remove_fade_points_multiplatform");
    FunctionPtr fmod_channel_control_remove_fade_points_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_remove_fade_points_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_remove_fade_points_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_fade_points_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_get_fade_points_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_fade_points_multiplatform");
    FunctionPtr fmod_channel_control_get_fade_points_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_fade_points_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_fade_points_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_set_callback", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_callback");
    FunctionPtr fmod_channel_control_set_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_callback(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_system_object(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_system_object", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_system_object");
    FunctionPtr fmod_channel_control_get_system_object = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_system_object == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_system_object(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_control_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_set_user_data");
    FunctionPtr fmod_channel_control_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_control_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_control_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_control_get_user_data");
    FunctionPtr fmod_channel_control_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_control_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_control_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_get_num_channels(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_group_get_num_channels", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_get_num_channels");
    FunctionPtr fmod_channel_group_get_num_channels = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_get_num_channels == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_group_get_num_channels(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_get_channel(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_group_get_channel", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_get_channel");
    FunctionPtr fmod_channel_group_get_channel = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_get_channel == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_group_get_channel(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_add_group_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_channel_group_add_group_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_add_group_multiplatform");
    FunctionPtr fmod_channel_group_add_group_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_add_group_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_group_add_group_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_get_num_groups(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_group_get_num_groups", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_get_num_groups");
    FunctionPtr fmod_channel_group_get_num_groups = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_get_num_groups == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_group_get_num_groups(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_get_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_channel_group_get_group", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_get_group");
    FunctionPtr fmod_channel_group_get_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_get_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_group_get_group(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_get_parent_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_group_get_parent_group", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_get_parent_group");
    FunctionPtr fmod_channel_group_get_parent_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_get_parent_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_group_get_parent_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_get_name(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_group_get_name", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_get_name");
    FunctionPtr fmod_channel_group_get_name = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_get_name == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_channel_group_get_name(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_group_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_release");
    FunctionPtr fmod_channel_group_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_group_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_channel_group_get_system_object(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_channel_group_get_system_object", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_channel_group_get_system_object");
    FunctionPtr fmod_channel_group_get_system_object = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_channel_group_get_system_object == nullptr) return gmval_undefined();
    // function call
    double result = fmod_channel_group_get_system_object(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_file_get_disk_busy(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_file_get_disk_busy", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_file_get_disk_busy");
    FunctionPtr fmod_file_get_disk_busy = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_file_get_disk_busy == nullptr) return gmval_undefined();
    // function call
    double result = fmod_file_get_disk_busy();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_file_set_disk_busy(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_file_set_disk_busy", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_file_set_disk_busy");
    FunctionPtr fmod_file_set_disk_busy = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_file_set_disk_busy == nullptr) return gmval_undefined();
    // function call
    double result = fmod_file_set_disk_busy(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_memory_get_stats_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_memory_get_stats_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_memory_get_stats_multiplatform");
    FunctionPtr fmod_memory_get_stats_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_memory_get_stats_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_memory_get_stats_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_debug_initialize_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_debug_initialize_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_debug_initialize_multiplatform");
    FunctionPtr fmod_debug_initialize_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_debug_initialize_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_debug_initialize_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_thread_set_attributes(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_thread_set_attributes", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_thread_set_attributes");
    FunctionPtr fmod_thread_set_attributes = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_thread_set_attributes == nullptr) return gmval_undefined();
    // function call
    double result = fmod_thread_set_attributes(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_add_input_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_add_input_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_add_input_multiplatform");
    FunctionPtr fmod_dsp_add_input_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_add_input_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_add_input_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_input_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_get_input_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_input_multiplatform");
    FunctionPtr fmod_dsp_get_input_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_input_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_input_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_output_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_get_output_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_output_multiplatform");
    FunctionPtr fmod_dsp_get_output_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_output_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_output_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_num_inputs(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_num_inputs", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_num_inputs");
    FunctionPtr fmod_dsp_get_num_inputs = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_num_inputs == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_num_inputs(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_num_outputs(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_num_outputs", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_num_outputs");
    FunctionPtr fmod_dsp_get_num_outputs = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_num_outputs == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_num_outputs(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_disconnect_all(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_disconnect_all", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_disconnect_all");
    FunctionPtr fmod_dsp_disconnect_all = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_disconnect_all == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_disconnect_all(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_disconnect_from_mutliplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_disconnect_from_mutliplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_disconnect_from_mutliplatform");
    FunctionPtr fmod_dsp_disconnect_from_mutliplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_disconnect_from_mutliplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_disconnect_from_mutliplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_data_parameter_index(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_data_parameter_index", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_data_parameter_index");
    FunctionPtr fmod_dsp_get_data_parameter_index = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_data_parameter_index == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_data_parameter_index(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_num_parameters(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_num_parameters", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_num_parameters");
    FunctionPtr fmod_dsp_get_num_parameters = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_num_parameters == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_num_parameters(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_parameter_bool(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_set_parameter_bool", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_parameter_bool");
    FunctionPtr fmod_dsp_set_parameter_bool = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_parameter_bool == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_parameter_bool(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_bool(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_parameter_bool", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_parameter_bool");
    FunctionPtr fmod_dsp_get_parameter_bool = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_parameter_bool == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_parameter_bool(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_parameter_data_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_dsp_set_parameter_data_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_parameter_data_multiplatform");
    FunctionPtr fmod_dsp_set_parameter_data_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_parameter_data_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_parameter_data_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_data_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_dsp_get_parameter_data_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_parameter_data_multiplatform");
    FunctionPtr fmod_dsp_get_parameter_data_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_parameter_data_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_parameter_data_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_parameter_float(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_set_parameter_float", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_parameter_float");
    FunctionPtr fmod_dsp_set_parameter_float = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_parameter_float == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_parameter_float(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_float(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_parameter_float", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_parameter_float");
    FunctionPtr fmod_dsp_get_parameter_float = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_parameter_float == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_parameter_float(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_parameter_int(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_set_parameter_int", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_parameter_int");
    FunctionPtr fmod_dsp_set_parameter_int = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_parameter_int == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_parameter_int(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_int(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_parameter_int", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_parameter_int");
    FunctionPtr fmod_dsp_get_parameter_int = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_parameter_int == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_parameter_int(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_info_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_get_parameter_info_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_parameter_info_multiplatform");
    FunctionPtr fmod_dsp_get_parameter_info_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_parameter_info_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_parameter_info_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_channel_format(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_dsp_set_channel_format", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_channel_format");
    FunctionPtr fmod_dsp_set_channel_format = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_channel_format == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_channel_format(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_channel_format_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_channel_format_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_channel_format_multiplatform");
    FunctionPtr fmod_dsp_get_channel_format_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_channel_format_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_channel_format_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_output_channel_format_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_get_output_channel_format_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_output_channel_format_multiplatform");
    FunctionPtr fmod_dsp_get_output_channel_format_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_output_channel_format_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_output_channel_format_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_metering_info_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_metering_info_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_metering_info_multiplatform");
    FunctionPtr fmod_dsp_get_metering_info_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_metering_info_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_metering_info_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_metering_enabled(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_set_metering_enabled", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_metering_enabled");
    FunctionPtr fmod_dsp_set_metering_enabled = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_metering_enabled == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_metering_enabled(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_metering_enabled_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_metering_enabled_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_metering_enabled_multiplatform");
    FunctionPtr fmod_dsp_get_metering_enabled_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_metering_enabled_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_metering_enabled_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_active(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_set_active", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_active");
    FunctionPtr fmod_dsp_set_active = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_active == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_active(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_active(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_active", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_active");
    FunctionPtr fmod_dsp_get_active = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_active == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_active(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_bypass(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_set_bypass", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_bypass");
    FunctionPtr fmod_dsp_set_bypass = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_bypass == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_bypass(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_bypass(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_bypass", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_bypass");
    FunctionPtr fmod_dsp_get_bypass = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_bypass == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_bypass(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_wet_dry_mix(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_dsp_set_wet_dry_mix", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_wet_dry_mix");
    FunctionPtr fmod_dsp_set_wet_dry_mix = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_wet_dry_mix == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_wet_dry_mix(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_wet_dry_mix_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_wet_dry_mix_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_wet_dry_mix_multiplatform");
    FunctionPtr fmod_dsp_get_wet_dry_mix_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_wet_dry_mix_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_wet_dry_mix_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_idle(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_idle", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_idle");
    FunctionPtr fmod_dsp_get_idle = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_idle == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_idle(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_reset(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_reset", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_reset");
    FunctionPtr fmod_dsp_reset = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_reset == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_reset(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_release");
    FunctionPtr fmod_dsp_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_type(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_type", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_type");
    FunctionPtr fmod_dsp_get_type = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_type == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_type(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_info_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_info_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_info_multiplatform");
    FunctionPtr fmod_dsp_get_info_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_info_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_info_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_cpu_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_get_cpu_usage_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_cpu_usage_multiplatform");
    FunctionPtr fmod_dsp_get_cpu_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_cpu_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_cpu_usage_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_user_data");
    FunctionPtr fmod_dsp_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_user_data");
    FunctionPtr fmod_dsp_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_set_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_set_callback", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_set_callback");
    FunctionPtr fmod_dsp_set_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_set_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_set_callback(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_get_system_object(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_get_system_object", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_get_system_object");
    FunctionPtr fmod_dsp_get_system_object = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_get_system_object == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_get_system_object(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_set_mix(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_connection_set_mix", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_set_mix");
    FunctionPtr fmod_dsp_connection_set_mix = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_set_mix == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_set_mix(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_mix(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_connection_get_mix", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_get_mix");
    FunctionPtr fmod_dsp_connection_get_mix = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_get_mix == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_get_mix(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_set_mix_matrix_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_connection_set_mix_matrix_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_set_mix_matrix_multiplatform");
    FunctionPtr fmod_dsp_connection_set_mix_matrix_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_set_mix_matrix_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_set_mix_matrix_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_mix_matrix_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_dsp_connection_get_mix_matrix_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_get_mix_matrix_multiplatform");
    FunctionPtr fmod_dsp_connection_get_mix_matrix_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_get_mix_matrix_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_get_mix_matrix_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_input(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_connection_get_input", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_get_input");
    FunctionPtr fmod_dsp_connection_get_input = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_get_input == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_get_input(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_output(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_connection_get_output", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_get_output");
    FunctionPtr fmod_dsp_connection_get_output = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_get_output == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_get_output(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_type(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_connection_get_type", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_get_type");
    FunctionPtr fmod_dsp_connection_get_type = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_get_type == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_get_type(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_dsp_connection_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_set_user_data");
    FunctionPtr fmod_dsp_connection_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_dsp_connection_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_dsp_connection_get_user_data");
    FunctionPtr fmod_dsp_connection_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_dsp_connection_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_dsp_connection_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_set_polygon_attributes(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 5)
        RunnerInterface_ArgCountError("fmod_geometry_set_polygon_attributes", argc, 5);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    double arg4;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    arg4 = gmval_CoerceReal(args[4]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_set_polygon_attributes");
    FunctionPtr fmod_geometry_set_polygon_attributes = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_set_polygon_attributes == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_set_polygon_attributes(arg0, arg1, arg2, arg3, arg4);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_polygon_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_geometry_get_polygon_attributes_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_polygon_attributes_multiplatform");
    FunctionPtr fmod_geometry_get_polygon_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_polygon_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_polygon_attributes_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_polygon_num_vertices(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_get_polygon_num_vertices", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_polygon_num_vertices");
    FunctionPtr fmod_geometry_get_polygon_num_vertices = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_polygon_num_vertices == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_polygon_num_vertices(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_set_polygon_vertex_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_geometry_set_polygon_vertex_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    const char* arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceCString(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_set_polygon_vertex_multiplatform");
    FunctionPtr fmod_geometry_set_polygon_vertex_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_set_polygon_vertex_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_set_polygon_vertex_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_polygon_vertex_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_geometry_get_polygon_vertex_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    const char* arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceCString(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_polygon_vertex_multiplatform");
    FunctionPtr fmod_geometry_get_polygon_vertex_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_polygon_vertex_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_polygon_vertex_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_set_position_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_set_position_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_set_position_multiplatform");
    FunctionPtr fmod_geometry_set_position_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_set_position_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_set_position_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_position_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_get_position_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_position_multiplatform");
    FunctionPtr fmod_geometry_get_position_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_position_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_position_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_set_rotation_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_set_rotation_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_set_rotation_multiplatform");
    FunctionPtr fmod_geometry_set_rotation_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_set_rotation_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_set_rotation_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_rotation_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_get_rotation_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_rotation_multiplatform");
    FunctionPtr fmod_geometry_get_rotation_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_rotation_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_rotation_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_set_scale_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_set_scale_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_set_scale_multiplatform");
    FunctionPtr fmod_geometry_set_scale_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_set_scale_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_set_scale_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_scale_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_get_scale_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_scale_multiplatform");
    FunctionPtr fmod_geometry_get_scale_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_scale_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_scale_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_add_polygon_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_add_polygon_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_add_polygon_multiplatform");
    FunctionPtr fmod_geometry_add_polygon_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_add_polygon_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_add_polygon_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_set_active(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_set_active", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_set_active");
    FunctionPtr fmod_geometry_set_active = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_set_active == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_set_active(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_active(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_geometry_get_active", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_active");
    FunctionPtr fmod_geometry_get_active = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_active == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_active(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_max_polygons_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_get_max_polygons_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_max_polygons_multiplatform");
    FunctionPtr fmod_geometry_get_max_polygons_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_max_polygons_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_max_polygons_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_num_polygons(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_geometry_get_num_polygons", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_num_polygons");
    FunctionPtr fmod_geometry_get_num_polygons = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_num_polygons == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_num_polygons(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_set_user_data");
    FunctionPtr fmod_geometry_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_geometry_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_get_user_data");
    FunctionPtr fmod_geometry_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_geometry_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_release");
    FunctionPtr fmod_geometry_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_geometry_save_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_geometry_save_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_geometry_save_multiplatform");
    FunctionPtr fmod_geometry_save_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_geometry_save_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_geometry_save_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_set_3d_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_reverb_3d_set_3d_attributes_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    const char* arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_set_3d_attributes_multiplatform");
    FunctionPtr fmod_reverb_3d_set_3d_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_set_3d_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_set_3d_attributes_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_get_3d_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_reverb_3d_get_3d_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_get_3d_attributes_multiplatform");
    FunctionPtr fmod_reverb_3d_get_3d_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_get_3d_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_get_3d_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_set_properties(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 13)
        RunnerInterface_ArgCountError("fmod_reverb_3d_set_properties", argc, 13);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    double arg4;
    double arg5;
    double arg6;
    double arg7;
    double arg8;
    double arg9;
    double arg10;
    double arg11;
    double arg12;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    arg4 = gmval_CoerceReal(args[4]);
    arg5 = gmval_CoerceReal(args[5]);
    arg6 = gmval_CoerceReal(args[6]);
    arg7 = gmval_CoerceReal(args[7]);
    arg8 = gmval_CoerceReal(args[8]);
    arg9 = gmval_CoerceReal(args[9]);
    arg10 = gmval_CoerceReal(args[10]);
    arg11 = gmval_CoerceReal(args[11]);
    arg12 = gmval_CoerceReal(args[12]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double, double, double, double, double, double, double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_set_properties");
    FunctionPtr fmod_reverb_3d_set_properties = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_set_properties == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_set_properties(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_get_properties_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_reverb_3d_get_properties_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_get_properties_multiplatform");
    FunctionPtr fmod_reverb_3d_get_properties_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_get_properties_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_get_properties_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_set_active(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_reverb_3d_set_active", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_set_active");
    FunctionPtr fmod_reverb_3d_set_active = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_set_active == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_set_active(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_get_active(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_reverb_3d_get_active", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_get_active");
    FunctionPtr fmod_reverb_3d_get_active = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_get_active == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_get_active(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_reverb_3d_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_release");
    FunctionPtr fmod_reverb_3d_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_reverb_3d_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_set_user_data");
    FunctionPtr fmod_reverb_3d_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_reverb_3d_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_reverb_3d_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_reverb_3d_get_user_data");
    FunctionPtr fmod_reverb_3d_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_reverb_3d_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_reverb_3d_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_name(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_name", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_name");
    FunctionPtr fmod_sound_get_name = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_name == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_sound_get_name(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_format_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_format_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_format_multiplatform");
    FunctionPtr fmod_sound_get_format_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_format_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_format_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_length(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_length", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_length");
    FunctionPtr fmod_sound_get_length = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_length == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_length(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_num_tags_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_num_tags_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_num_tags_multiplatform");
    FunctionPtr fmod_sound_get_num_tags_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_num_tags_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_num_tags_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_tag_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_sound_get_tag_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    const char* arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    arg3 = gmval_CoerceCString(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_tag_multiplatform");
    FunctionPtr fmod_sound_get_tag_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_tag_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_tag_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_3d_cone_settings(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_sound_set_3d_cone_settings", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_3d_cone_settings");
    FunctionPtr fmod_sound_set_3d_cone_settings = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_3d_cone_settings == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_3d_cone_settings(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_3d_cone_settings_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_3d_cone_settings_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_3d_cone_settings_multiplatform");
    FunctionPtr fmod_sound_get_3d_cone_settings_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_3d_cone_settings_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_3d_cone_settings_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_3d_custom_rolloff_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_set_3d_custom_rolloff_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_3d_custom_rolloff_multiplatform");
    FunctionPtr fmod_sound_set_3d_custom_rolloff_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_3d_custom_rolloff_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_3d_custom_rolloff_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_3d_custom_rolloff_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_3d_custom_rolloff_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_3d_custom_rolloff_multiplatform");
    FunctionPtr fmod_sound_get_3d_custom_rolloff_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_3d_custom_rolloff_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_3d_custom_rolloff_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_3d_min_max_distance(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_sound_set_3d_min_max_distance", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_3d_min_max_distance");
    FunctionPtr fmod_sound_set_3d_min_max_distance = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_3d_min_max_distance == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_3d_min_max_distance(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_3d_min_max_distance_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_3d_min_max_distance_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_3d_min_max_distance_multiplatform");
    FunctionPtr fmod_sound_get_3d_min_max_distance_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_3d_min_max_distance_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_3d_min_max_distance_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_defaults(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_sound_set_defaults", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_defaults");
    FunctionPtr fmod_sound_set_defaults = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_defaults == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_defaults(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_defaults_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_defaults_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_defaults_multiplatform");
    FunctionPtr fmod_sound_get_defaults_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_defaults_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_defaults_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_mode(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_set_mode", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_mode");
    FunctionPtr fmod_sound_set_mode = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_mode == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_mode(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_mode(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_mode", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_mode");
    FunctionPtr fmod_sound_get_mode = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_mode == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_mode(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_loop_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_set_loop_count", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_loop_count");
    FunctionPtr fmod_sound_set_loop_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_loop_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_loop_count(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_loop_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_loop_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_loop_count");
    FunctionPtr fmod_sound_get_loop_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_loop_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_loop_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_loop_points(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 5)
        RunnerInterface_ArgCountError("fmod_sound_set_loop_points", argc, 5);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    double arg4;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    arg4 = gmval_CoerceReal(args[4]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_loop_points");
    FunctionPtr fmod_sound_set_loop_points = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_loop_points == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_loop_points(arg0, arg1, arg2, arg3, arg4);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_loop_points_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_sound_get_loop_points_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    const char* arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceCString(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_loop_points_multiplatform");
    FunctionPtr fmod_sound_get_loop_points_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_loop_points_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_loop_points_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_sound_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_set_sound_group", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_sound_group");
    FunctionPtr fmod_sound_set_sound_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_sound_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_sound_group(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_sound_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_sound_group", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_sound_group");
    FunctionPtr fmod_sound_get_sound_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_sound_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_sound_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_num_sub_sounds(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_num_sub_sounds", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_num_sub_sounds");
    FunctionPtr fmod_sound_get_num_sub_sounds = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_num_sub_sounds == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_num_sub_sounds(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_sub_sound(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_sub_sound", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_sub_sound");
    FunctionPtr fmod_sound_get_sub_sound = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_sub_sound == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_sub_sound(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_sub_sound_parent(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_sub_sound_parent", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_sub_sound_parent");
    FunctionPtr fmod_sound_get_sub_sound_parent = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_sub_sound_parent == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_sub_sound_parent(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_open_state_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_open_state_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_open_state_multiplatform");
    FunctionPtr fmod_sound_get_open_state_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_open_state_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_open_state_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_read_data_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_read_data_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_read_data_multiplatform");
    FunctionPtr fmod_sound_read_data_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_read_data_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_read_data_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_seek_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_seek_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_seek_data");
    FunctionPtr fmod_sound_seek_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_seek_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_seek_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_lock_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_sound_lock_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_lock_multiplatform");
    FunctionPtr fmod_sound_lock_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_lock_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_lock_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_unlock_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_unlock_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_unlock_multiplatform");
    FunctionPtr fmod_sound_unlock_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_unlock_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_unlock_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_music_num_channels(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_music_num_channels", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_music_num_channels");
    FunctionPtr fmod_sound_get_music_num_channels = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_music_num_channels == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_music_num_channels(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_music_channel_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_sound_set_music_channel_volume", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_music_channel_volume");
    FunctionPtr fmod_sound_set_music_channel_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_music_channel_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_music_channel_volume(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_music_channel_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_get_music_channel_volume", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_music_channel_volume");
    FunctionPtr fmod_sound_get_music_channel_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_music_channel_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_music_channel_volume(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_music_speed(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_set_music_speed", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_music_speed");
    FunctionPtr fmod_sound_set_music_speed = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_music_speed == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_music_speed(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_music_speed(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_music_speed", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_music_speed");
    FunctionPtr fmod_sound_get_music_speed = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_music_speed == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_music_speed(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_sync_point_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_sound_get_sync_point_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    const char* arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceCString(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_sync_point_multiplatform");
    FunctionPtr fmod_sound_get_sync_point_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_sync_point_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_sync_point_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_num_sync_points(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_num_sync_points", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_num_sync_points");
    FunctionPtr fmod_sound_get_num_sync_points = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_num_sync_points == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_num_sync_points(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_add_sync_point(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_sound_add_sync_point", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    const char* arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceCString(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_add_sync_point");
    FunctionPtr fmod_sound_add_sync_point = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_add_sync_point == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_add_sync_point(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_delete_sync_point(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_delete_sync_point", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_delete_sync_point");
    FunctionPtr fmod_sound_delete_sync_point = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_delete_sync_point == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_delete_sync_point(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_release");
    FunctionPtr fmod_sound_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_system_object(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_system_object", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_system_object");
    FunctionPtr fmod_sound_get_system_object = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_system_object == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_system_object(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_set_user_data");
    FunctionPtr fmod_sound_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_get_user_data");
    FunctionPtr fmod_sound_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_set_max_audible(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_group_set_max_audible", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_set_max_audible");
    FunctionPtr fmod_sound_group_set_max_audible = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_set_max_audible == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_set_max_audible(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_max_audible(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_max_audible", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_max_audible");
    FunctionPtr fmod_sound_group_get_max_audible = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_max_audible == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_max_audible(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_set_max_audible_behavior(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_group_set_max_audible_behavior", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_set_max_audible_behavior");
    FunctionPtr fmod_sound_group_set_max_audible_behavior = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_set_max_audible_behavior == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_set_max_audible_behavior(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_max_audible_behavior(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_max_audible_behavior", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_max_audible_behavior");
    FunctionPtr fmod_sound_group_get_max_audible_behavior = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_max_audible_behavior == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_max_audible_behavior(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_set_mute_fade_speed(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_group_set_mute_fade_speed", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_set_mute_fade_speed");
    FunctionPtr fmod_sound_group_set_mute_fade_speed = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_set_mute_fade_speed == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_set_mute_fade_speed(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_mute_fade_speed(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_mute_fade_speed", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_mute_fade_speed");
    FunctionPtr fmod_sound_group_get_mute_fade_speed = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_mute_fade_speed == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_mute_fade_speed(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_set_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_group_set_volume", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_set_volume");
    FunctionPtr fmod_sound_group_set_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_set_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_set_volume(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_volume", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_volume");
    FunctionPtr fmod_sound_group_get_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_volume(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_num_sounds(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_num_sounds", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_num_sounds");
    FunctionPtr fmod_sound_group_get_num_sounds = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_num_sounds == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_num_sounds(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_sound(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_group_get_sound", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_sound");
    FunctionPtr fmod_sound_group_get_sound = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_sound == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_sound(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_num_playing(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_num_playing", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_num_playing");
    FunctionPtr fmod_sound_group_get_num_playing = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_num_playing == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_num_playing(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_stop(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_stop", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_stop");
    FunctionPtr fmod_sound_group_stop = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_stop == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_stop(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_name(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_name", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_name");
    FunctionPtr fmod_sound_group_get_name = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_name == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_sound_group_get_name(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_release");
    FunctionPtr fmod_sound_group_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_system_object(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_system_object", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_system_object");
    FunctionPtr fmod_sound_group_get_system_object = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_system_object == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_system_object(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_sound_group_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_set_user_data");
    FunctionPtr fmod_sound_group_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_sound_group_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_sound_group_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_sound_group_get_user_data");
    FunctionPtr fmod_sound_group_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_sound_group_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_sound_group_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_loading_state(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_loading_state", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_loading_state");
    FunctionPtr fmod_studio_bank_get_loading_state = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_loading_state == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_loading_state(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_load_sample_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_load_sample_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_load_sample_data");
    FunctionPtr fmod_studio_bank_load_sample_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_load_sample_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_load_sample_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_unload_sample_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_unload_sample_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_unload_sample_data");
    FunctionPtr fmod_studio_bank_unload_sample_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_unload_sample_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_unload_sample_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_sample_loading_state(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_sample_loading_state", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_sample_loading_state");
    FunctionPtr fmod_studio_bank_get_sample_loading_state = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_sample_loading_state == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_sample_loading_state(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_unload(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_unload", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_unload");
    FunctionPtr fmod_studio_bank_unload = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_unload == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_unload(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_bus_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_bus_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_bus_count");
    FunctionPtr fmod_studio_bank_get_bus_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_bus_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_bus_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_bus_list_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_bus_list_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_bus_list_multiplatform");
    FunctionPtr fmod_studio_bank_get_bus_list_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_bus_list_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_bus_list_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_event_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_event_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_event_count");
    FunctionPtr fmod_studio_bank_get_event_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_event_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_event_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_event_description_list_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_event_description_list_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_event_description_list_multiplatform");
    FunctionPtr fmod_studio_bank_get_event_description_list_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_event_description_list_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_event_description_list_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_string_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_string_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_string_count");
    FunctionPtr fmod_studio_bank_get_string_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_string_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_string_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_string_info_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_string_info_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_string_info_multiplatform");
    FunctionPtr fmod_studio_bank_get_string_info_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_string_info_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_string_info_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_vca_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_vca_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_vca_count");
    FunctionPtr fmod_studio_bank_get_vca_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_vca_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_vca_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_vca_list_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_vca_list_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_vca_list_multiplatform");
    FunctionPtr fmod_studio_bank_get_vca_list_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_vca_list_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_vca_list_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_id", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_id");
    FunctionPtr fmod_studio_bank_get_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_id == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_bank_get_id(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_path(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_path", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_path");
    FunctionPtr fmod_studio_bank_get_path = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_path == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_bank_get_path(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_is_valid(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_is_valid", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_is_valid");
    FunctionPtr fmod_studio_bank_is_valid = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_is_valid == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_is_valid(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bank_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_set_user_data");
    FunctionPtr fmod_studio_bank_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bank_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bank_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bank_get_user_data");
    FunctionPtr fmod_studio_bank_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bank_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bank_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_set_paused(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bus_set_paused", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_set_paused");
    FunctionPtr fmod_studio_bus_set_paused = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_set_paused == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_set_paused(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_paused(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_paused", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_paused");
    FunctionPtr fmod_studio_bus_get_paused = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_paused == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_get_paused(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_stop_all_events(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bus_stop_all_events", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_stop_all_events");
    FunctionPtr fmod_studio_bus_stop_all_events = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_stop_all_events == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_stop_all_events(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_set_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bus_set_volume", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_set_volume");
    FunctionPtr fmod_studio_bus_set_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_set_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_set_volume(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_volume", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_volume");
    FunctionPtr fmod_studio_bus_get_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_get_volume(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_set_mute(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bus_set_mute", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_set_mute");
    FunctionPtr fmod_studio_bus_set_mute = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_set_mute == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_set_mute(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_mute(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_mute", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_mute");
    FunctionPtr fmod_studio_bus_get_mute = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_mute == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_get_mute(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_set_port_index_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bus_set_port_index_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_set_port_index_multiplatform");
    FunctionPtr fmod_studio_bus_set_port_index_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_set_port_index_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_set_port_index_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_port_index_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_port_index_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_port_index_multiplatform");
    FunctionPtr fmod_studio_bus_get_port_index_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_port_index_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_get_port_index_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_channel_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_channel_group", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_channel_group");
    FunctionPtr fmod_studio_bus_get_channel_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_channel_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_get_channel_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_lock_channel_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_lock_channel_group", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_lock_channel_group");
    FunctionPtr fmod_studio_bus_lock_channel_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_lock_channel_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_lock_channel_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_unlock_channel_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_unlock_channel_group", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_unlock_channel_group");
    FunctionPtr fmod_studio_bus_unlock_channel_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_unlock_channel_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_unlock_channel_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_cpu_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_cpu_usage_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_cpu_usage_multiplatform");
    FunctionPtr fmod_studio_bus_get_cpu_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_cpu_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_get_cpu_usage_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_memory_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_memory_usage_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_memory_usage_multiplatform");
    FunctionPtr fmod_studio_bus_get_memory_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_memory_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_get_memory_usage_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_id", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_id");
    FunctionPtr fmod_studio_bus_get_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_id == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_bus_get_id(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_get_path(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_get_path", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_get_path");
    FunctionPtr fmod_studio_bus_get_path = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_get_path == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_bus_get_path(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_bus_is_valid(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_bus_is_valid", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_bus_is_valid");
    FunctionPtr fmod_studio_bus_is_valid = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_bus_is_valid == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_bus_is_valid(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_bank_path(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_set_bank_path", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_set_bank_path");
    FunctionPtr fmod_studio_command_replay_set_bank_path = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_set_bank_path == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_set_bank_path(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_create_instance_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_set_create_instance_callback", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_set_create_instance_callback");
    FunctionPtr fmod_studio_command_replay_set_create_instance_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_set_create_instance_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_set_create_instance_callback(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_frame_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_set_frame_callback", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_set_frame_callback");
    FunctionPtr fmod_studio_command_replay_set_frame_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_set_frame_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_set_frame_callback(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_load_bank_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_set_load_bank_callback", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_set_load_bank_callback");
    FunctionPtr fmod_studio_command_replay_set_load_bank_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_set_load_bank_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_set_load_bank_callback(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_start(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_start", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_start");
    FunctionPtr fmod_studio_command_replay_start = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_start == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_start(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_stop(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_stop", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_stop");
    FunctionPtr fmod_studio_command_replay_stop = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_stop == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_stop(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_current_command_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_current_command_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_current_command_multiplatform");
    FunctionPtr fmod_studio_command_replay_get_current_command_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_current_command_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_current_command_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_playback_state(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_playback_state", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_playback_state");
    FunctionPtr fmod_studio_command_replay_get_playback_state = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_playback_state == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_playback_state(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_paused(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_set_paused", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_set_paused");
    FunctionPtr fmod_studio_command_replay_set_paused = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_set_paused == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_set_paused(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_paused(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_paused", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_paused");
    FunctionPtr fmod_studio_command_replay_get_paused = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_paused == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_paused(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_seek_to_command(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_seek_to_command", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_seek_to_command");
    FunctionPtr fmod_studio_command_replay_seek_to_command = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_seek_to_command == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_seek_to_command(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_seek_to_time(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_seek_to_time", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_seek_to_time");
    FunctionPtr fmod_studio_command_replay_seek_to_time = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_seek_to_time == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_seek_to_time(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_command_at_time(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_command_at_time", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_command_at_time");
    FunctionPtr fmod_studio_command_replay_get_command_at_time = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_command_at_time == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_command_at_time(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_command_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_command_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_command_count");
    FunctionPtr fmod_studio_command_replay_get_command_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_command_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_command_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_command_info_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_command_info_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_command_info_multiplatform");
    FunctionPtr fmod_studio_command_replay_get_command_info_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_command_info_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_command_info_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_command_string(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_command_string", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_command_string");
    FunctionPtr fmod_studio_command_replay_get_command_string = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_command_string == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_command_replay_get_command_string(arg0, arg1);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_length(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_length", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_length");
    FunctionPtr fmod_studio_command_replay_get_length = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_length == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_length(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_system_object(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_system_object", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_system_object");
    FunctionPtr fmod_studio_command_replay_get_system_object = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_system_object == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_system_object(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_is_valid(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_is_valid", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_is_valid");
    FunctionPtr fmod_studio_command_replay_is_valid = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_is_valid == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_is_valid(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_set_user_data");
    FunctionPtr fmod_studio_command_replay_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_get_user_data");
    FunctionPtr fmod_studio_command_replay_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_command_replay_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_command_replay_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_command_replay_release");
    FunctionPtr fmod_studio_command_replay_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_command_replay_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_command_replay_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_create_instance(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_create_instance", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_create_instance");
    FunctionPtr fmod_studio_event_description_create_instance = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_create_instance == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_create_instance(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_instance_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_instance_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_instance_count");
    FunctionPtr fmod_studio_event_description_get_instance_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_instance_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_instance_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_instance_list_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_instance_list_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_instance_list_multiplatform");
    FunctionPtr fmod_studio_event_description_get_instance_list_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_instance_list_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_instance_list_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_release_all_instances(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_release_all_instances", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_release_all_instances");
    FunctionPtr fmod_studio_event_description_release_all_instances = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_release_all_instances == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_release_all_instances(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_load_sample_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_load_sample_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_load_sample_data");
    FunctionPtr fmod_studio_event_description_load_sample_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_load_sample_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_load_sample_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_unload_sample_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_unload_sample_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_unload_sample_data");
    FunctionPtr fmod_studio_event_description_unload_sample_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_unload_sample_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_unload_sample_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_sample_loading_state(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_sample_loading_state", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_sample_loading_state");
    FunctionPtr fmod_studio_event_description_get_sample_loading_state = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_sample_loading_state == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_sample_loading_state(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_3d(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_is_3d", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_is_3d");
    FunctionPtr fmod_studio_event_description_is_3d = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_is_3d == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_is_3d(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_doppler_enabled(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_is_doppler_enabled", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_is_doppler_enabled");
    FunctionPtr fmod_studio_event_description_is_doppler_enabled = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_is_doppler_enabled == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_is_doppler_enabled(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_oneshot(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_is_oneshot", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_is_oneshot");
    FunctionPtr fmod_studio_event_description_is_oneshot = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_is_oneshot == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_is_oneshot(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_snapshot(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_is_snapshot", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_is_snapshot");
    FunctionPtr fmod_studio_event_description_is_snapshot = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_is_snapshot == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_is_snapshot(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_stream(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_is_stream", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_is_stream");
    FunctionPtr fmod_studio_event_description_is_stream = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_is_stream == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_is_stream(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_has_sustain_point(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_has_sustain_point", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_has_sustain_point");
    FunctionPtr fmod_studio_event_description_has_sustain_point = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_has_sustain_point == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_has_sustain_point(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_min_max_distance_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_min_max_distance_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_min_max_distance_multiplatform");
    FunctionPtr fmod_studio_event_description_get_min_max_distance_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_min_max_distance_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_min_max_distance_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_sound_size(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_sound_size", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_sound_size");
    FunctionPtr fmod_studio_event_description_get_sound_size = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_sound_size == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_sound_size(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_description_by_name_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_parameter_description_by_name_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_parameter_description_by_name_multiplatform");
    FunctionPtr fmod_studio_event_description_get_parameter_description_by_name_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_parameter_description_by_name_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_parameter_description_by_name_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_description_by_id_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_parameter_description_by_id_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_parameter_description_by_id_multiplatform");
    FunctionPtr fmod_studio_event_description_get_parameter_description_by_id_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_parameter_description_by_id_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_parameter_description_by_id_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_description_by_index_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_parameter_description_by_index_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_parameter_description_by_index_multiplatform");
    FunctionPtr fmod_studio_event_description_get_parameter_description_by_index_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_parameter_description_by_index_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_parameter_description_by_index_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_description_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_parameter_description_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_parameter_description_count");
    FunctionPtr fmod_studio_event_description_get_parameter_description_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_parameter_description_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_parameter_description_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_label_by_name(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_parameter_label_by_name", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double, const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_parameter_label_by_name");
    FunctionPtr fmod_studio_event_description_get_parameter_label_by_name = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_parameter_label_by_name == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_event_description_get_parameter_label_by_name(arg0, arg1, arg2);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_label_by_id_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_parameter_label_by_id_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double, const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_parameter_label_by_id_multiplatform");
    FunctionPtr fmod_studio_event_description_get_parameter_label_by_id_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_parameter_label_by_id_multiplatform == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_event_description_get_parameter_label_by_id_multiplatform(arg0, arg1, arg2);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_label_by_index(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_parameter_label_by_index", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_parameter_label_by_index");
    FunctionPtr fmod_studio_event_description_get_parameter_label_by_index = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_parameter_label_by_index == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_event_description_get_parameter_label_by_index(arg0, arg1, arg2);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_user_property_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_user_property_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_user_property_multiplatform");
    FunctionPtr fmod_studio_event_description_get_user_property_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_user_property_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_user_property_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_user_property_by_index_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_user_property_by_index_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_user_property_by_index_multiplatform");
    FunctionPtr fmod_studio_event_description_get_user_property_by_index_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_user_property_by_index_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_user_property_by_index_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_user_property_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_user_property_count", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_user_property_count");
    FunctionPtr fmod_studio_event_description_get_user_property_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_user_property_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_user_property_count(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_id", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_id");
    FunctionPtr fmod_studio_event_description_get_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_id == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_event_description_get_id(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_length(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_length", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_length");
    FunctionPtr fmod_studio_event_description_get_length = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_length == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_length(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_path(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_path", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_path");
    FunctionPtr fmod_studio_event_description_get_path = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_path == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_event_description_get_path(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_set_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_description_set_callback", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_set_callback");
    FunctionPtr fmod_studio_event_description_set_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_set_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_set_callback(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_description_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_set_user_data");
    FunctionPtr fmod_studio_event_description_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_get_user_data");
    FunctionPtr fmod_studio_event_description_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_valid(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_description_is_valid", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_description_is_valid");
    FunctionPtr fmod_studio_event_description_is_valid = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_description_is_valid == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_description_is_valid(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_start(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_start", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_start");
    FunctionPtr fmod_studio_event_instance_start = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_start == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_start(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_stop(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_stop", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_stop");
    FunctionPtr fmod_studio_event_instance_stop = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_stop == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_stop(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_playback_state(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_playback_state", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_playback_state");
    FunctionPtr fmod_studio_event_instance_get_playback_state = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_playback_state == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_playback_state(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_paused(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_paused", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_paused");
    FunctionPtr fmod_studio_event_instance_set_paused = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_paused == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_paused(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_paused(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_paused", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_paused");
    FunctionPtr fmod_studio_event_instance_get_paused = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_paused == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_paused(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_keyoff(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_keyoff", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_keyoff");
    FunctionPtr fmod_studio_event_instance_keyoff = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_keyoff == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_keyoff(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_pitch(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_pitch", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_pitch");
    FunctionPtr fmod_studio_event_instance_set_pitch = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_pitch == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_pitch(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_pitch(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_pitch", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_pitch");
    FunctionPtr fmod_studio_event_instance_get_pitch = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_pitch == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_pitch(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_property(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_property", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_property");
    FunctionPtr fmod_studio_event_instance_set_property = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_property == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_property(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_property(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_property", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_property");
    FunctionPtr fmod_studio_event_instance_get_property = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_property == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_property(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_timeline_position(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_timeline_position", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_timeline_position");
    FunctionPtr fmod_studio_event_instance_set_timeline_position = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_timeline_position == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_timeline_position(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_timeline_position(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_timeline_position", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_timeline_position");
    FunctionPtr fmod_studio_event_instance_get_timeline_position = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_timeline_position == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_timeline_position(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_volume", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_volume");
    FunctionPtr fmod_studio_event_instance_set_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_volume(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_volume_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_volume_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_volume_multiplatform");
    FunctionPtr fmod_studio_event_instance_get_volume_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_volume_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_volume_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_is_virtual(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_is_virtual", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_is_virtual");
    FunctionPtr fmod_studio_event_instance_is_virtual = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_is_virtual == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_is_virtual(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_3d_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_3d_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_3d_attributes_multiplatform");
    FunctionPtr fmod_studio_event_instance_set_3d_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_3d_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_3d_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_3d_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_3d_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_3d_attributes_multiplatform");
    FunctionPtr fmod_studio_event_instance_get_3d_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_3d_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_3d_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_listener_mask(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_listener_mask", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_listener_mask");
    FunctionPtr fmod_studio_event_instance_set_listener_mask = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_listener_mask == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_listener_mask(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_listener_mask(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_listener_mask", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_listener_mask");
    FunctionPtr fmod_studio_event_instance_get_listener_mask = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_listener_mask == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_listener_mask(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_min_max_distance_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_min_max_distance_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_min_max_distance_multiplatform");
    FunctionPtr fmod_studio_event_instance_get_min_max_distance_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_min_max_distance_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_min_max_distance_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_parameter_by_name_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_parameter_by_name_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    const char* arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_parameter_by_name_multiplatform");
    FunctionPtr fmod_studio_event_instance_set_parameter_by_name_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_parameter_by_name_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_parameter_by_name_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_parameter_by_name_with_label(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_parameter_by_name_with_label", argc, 4);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_parameter_by_name_with_label");
    FunctionPtr fmod_studio_event_instance_set_parameter_by_name_with_label = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_parameter_by_name_with_label == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_parameter_by_name_with_label(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_parameter_by_name_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_parameter_by_name_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_parameter_by_name_multiplatform");
    FunctionPtr fmod_studio_event_instance_get_parameter_by_name_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_parameter_by_name_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_parameter_by_name_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_parameter_by_id_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_parameter_by_id_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    const char* arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_parameter_by_id_multiplatform");
    FunctionPtr fmod_studio_event_instance_set_parameter_by_id_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_parameter_by_id_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_parameter_by_id_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform");
    FunctionPtr fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_parameter_by_id_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_parameter_by_id_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    const char* arg1;
    const char* arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_parameter_by_id_multiplatform");
    FunctionPtr fmod_studio_event_instance_get_parameter_by_id_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_parameter_by_id_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_parameter_by_id_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_channel_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_channel_group", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_channel_group");
    FunctionPtr fmod_studio_event_instance_get_channel_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_channel_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_channel_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_reverb_level(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_reverb_level", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_reverb_level");
    FunctionPtr fmod_studio_event_instance_set_reverb_level = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_reverb_level == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_reverb_level(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_reverb_level(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_reverb_level", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_reverb_level");
    FunctionPtr fmod_studio_event_instance_get_reverb_level = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_reverb_level == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_reverb_level(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_cpu_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_cpu_usage_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_cpu_usage_multiplatform");
    FunctionPtr fmod_studio_event_instance_get_cpu_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_cpu_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_cpu_usage_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_memory_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_memory_usage_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_memory_usage_multiplatform");
    FunctionPtr fmod_studio_event_instance_get_memory_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_memory_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_memory_usage_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_callback", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_callback");
    FunctionPtr fmod_studio_event_instance_set_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_callback(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_set_user_data");
    FunctionPtr fmod_studio_event_instance_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_user_data");
    FunctionPtr fmod_studio_event_instance_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_description(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_get_description", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_get_description");
    FunctionPtr fmod_studio_event_instance_get_description = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_get_description == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_get_description(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_release");
    FunctionPtr fmod_studio_event_instance_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_event_instance_is_valid(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_event_instance_is_valid", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_event_instance_is_valid");
    FunctionPtr fmod_studio_event_instance_is_valid = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_event_instance_is_valid == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_event_instance_is_valid(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_create(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_create", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_create");
    FunctionPtr fmod_studio_system_create = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_create == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_create();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_init(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_system_init", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_init");
    FunctionPtr fmod_studio_system_init = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_init == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_init(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_release", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_release");
    FunctionPtr fmod_studio_system_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_release();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_update_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_update_multiplatform", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_update_multiplatform");
    FunctionPtr fmod_studio_system_update_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_update_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_update_multiplatform();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_flush_commands(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_flush_commands", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_flush_commands");
    FunctionPtr fmod_studio_system_flush_commands = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_flush_commands == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_flush_commands();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_flush_sample_loading(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_flush_sample_loading", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_flush_sample_loading");
    FunctionPtr fmod_studio_system_flush_sample_loading = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_flush_sample_loading == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_flush_sample_loading();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_load_bank_custom(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_load_bank_custom", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_load_bank_custom");
    FunctionPtr fmod_studio_system_load_bank_custom = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_load_bank_custom == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_load_bank_custom(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_load_bank_file(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_load_bank_file", argc, 2);
    // coerce arguments
    const char* arg0;
    double arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_load_bank_file");
    FunctionPtr fmod_studio_system_load_bank_file = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_load_bank_file == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_load_bank_file(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_load_bank_memory_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_studio_system_load_bank_memory_multiplatform", argc, 4);
    // coerce arguments
    const char* arg0;
    double arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_load_bank_memory_multiplatform");
    FunctionPtr fmod_studio_system_load_bank_memory_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_load_bank_memory_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_load_bank_memory_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_unload_all(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_unload_all", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_unload_all");
    FunctionPtr fmod_studio_system_unload_all = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_unload_all == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_unload_all();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_bank(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_bank", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_bank");
    FunctionPtr fmod_studio_system_get_bank = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_bank == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_bank(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_bank_by_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_bank_by_id", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_bank_by_id");
    FunctionPtr fmod_studio_system_get_bank_by_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_bank_by_id == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_bank_by_id(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_bank_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_get_bank_count", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_bank_count");
    FunctionPtr fmod_studio_system_get_bank_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_bank_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_bank_count();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_bank_list_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_bank_list_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_bank_list_multiplatform");
    FunctionPtr fmod_studio_system_get_bank_list_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_bank_list_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_bank_list_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_listener_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_set_listener_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_listener_attributes_multiplatform");
    FunctionPtr fmod_studio_system_set_listener_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_listener_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_listener_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_listener_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_get_listener_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_listener_attributes_multiplatform");
    FunctionPtr fmod_studio_system_get_listener_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_listener_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_listener_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_listener_weight(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_set_listener_weight", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_listener_weight");
    FunctionPtr fmod_studio_system_set_listener_weight = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_listener_weight == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_listener_weight(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_listener_weight(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_listener_weight", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_listener_weight");
    FunctionPtr fmod_studio_system_get_listener_weight = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_listener_weight == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_listener_weight(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_num_listeners(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_set_num_listeners", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_num_listeners");
    FunctionPtr fmod_studio_system_set_num_listeners = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_num_listeners == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_num_listeners(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_num_listeners(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_get_num_listeners", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_num_listeners");
    FunctionPtr fmod_studio_system_get_num_listeners = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_num_listeners == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_num_listeners();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_bus(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_bus", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_bus");
    FunctionPtr fmod_studio_system_get_bus = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_bus == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_bus(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_bus_by_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_bus_by_id", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_bus_by_id");
    FunctionPtr fmod_studio_system_get_bus_by_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_bus_by_id == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_bus_by_id(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_event(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_event", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_event");
    FunctionPtr fmod_studio_system_get_event = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_event == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_event(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_event_by_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_event_by_id", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_event_by_id");
    FunctionPtr fmod_studio_system_get_event_by_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_event_by_id == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_event_by_id(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_by_id_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_get_parameter_by_id_multiplatform", argc, 2);
    // coerce arguments
    const char* arg0;
    const char* arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_parameter_by_id_multiplatform");
    FunctionPtr fmod_studio_system_get_parameter_by_id_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_parameter_by_id_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_parameter_by_id_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_parameter_by_id_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_system_set_parameter_by_id_multiplatform", argc, 3);
    // coerce arguments
    const char* arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_parameter_by_id_multiplatform");
    FunctionPtr fmod_studio_system_set_parameter_by_id_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_parameter_by_id_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_parameter_by_id_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_parameter_by_id_with_label_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_system_set_parameter_by_id_with_label_multiplatform", argc, 3);
    // coerce arguments
    const char* arg0;
    const char* arg1;
    double arg2;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_parameter_by_id_with_label_multiplatform");
    FunctionPtr fmod_studio_system_set_parameter_by_id_with_label_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_parameter_by_id_with_label_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_parameter_by_id_with_label_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_by_name_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_get_parameter_by_name_multiplatform", argc, 2);
    // coerce arguments
    const char* arg0;
    const char* arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_parameter_by_name_multiplatform");
    FunctionPtr fmod_studio_system_get_parameter_by_name_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_parameter_by_name_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_parameter_by_name_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_parameter_by_name_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_system_set_parameter_by_name_multiplatform", argc, 3);
    // coerce arguments
    const char* arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_parameter_by_name_multiplatform");
    FunctionPtr fmod_studio_system_set_parameter_by_name_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_parameter_by_name_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_parameter_by_name_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_parameter_by_name_with_label_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_studio_system_set_parameter_by_name_with_label_multiplatform", argc, 3);
    // coerce arguments
    const char* arg0;
    const char* arg1;
    double arg2;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_parameter_by_name_with_label_multiplatform");
    FunctionPtr fmod_studio_system_set_parameter_by_name_with_label_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_parameter_by_name_with_label_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_parameter_by_name_with_label_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_description_by_name_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_get_parameter_description_by_name_multiplatform", argc, 2);
    // coerce arguments
    const char* arg0;
    const char* arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_parameter_description_by_name_multiplatform");
    FunctionPtr fmod_studio_system_get_parameter_description_by_name_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_parameter_description_by_name_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_parameter_description_by_name_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_description_by_id_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_get_parameter_description_by_id_multiplatform", argc, 2);
    // coerce arguments
    const char* arg0;
    const char* arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_parameter_description_by_id_multiplatform");
    FunctionPtr fmod_studio_system_get_parameter_description_by_id_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_parameter_description_by_id_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_parameter_description_by_id_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_description_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_get_parameter_description_count", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_parameter_description_count");
    FunctionPtr fmod_studio_system_get_parameter_description_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_parameter_description_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_parameter_description_count();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_description_list_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_parameter_description_list_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_parameter_description_list_multiplatform");
    FunctionPtr fmod_studio_system_get_parameter_description_list_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_parameter_description_list_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_parameter_description_list_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_label_by_name(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_get_parameter_label_by_name", argc, 2);
    // coerce arguments
    const char* arg0;
    double arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = const char*(*)(const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_parameter_label_by_name");
    FunctionPtr fmod_studio_system_get_parameter_label_by_name = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_parameter_label_by_name == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_system_get_parameter_label_by_name(arg0, arg1);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_label_by_id_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_get_parameter_label_by_id_multiplatform", argc, 2);
    // coerce arguments
    const char* arg0;
    double arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = const char*(*)(const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_parameter_label_by_id_multiplatform");
    FunctionPtr fmod_studio_system_get_parameter_label_by_id_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_parameter_label_by_id_multiplatform == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_system_get_parameter_label_by_id_multiplatform(arg0, arg1);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_vca(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_vca", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_vca");
    FunctionPtr fmod_studio_system_get_vca = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_vca == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_vca(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_vca_by_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_vca_by_id", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_vca_by_id");
    FunctionPtr fmod_studio_system_get_vca_by_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_vca_by_id == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_vca_by_id(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_advanced_settings_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_set_advanced_settings_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_advanced_settings_multiplatform");
    FunctionPtr fmod_studio_system_set_advanced_settings_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_advanced_settings_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_advanced_settings_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_advanced_settings_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_advanced_settings_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_advanced_settings_multiplatform");
    FunctionPtr fmod_studio_system_get_advanced_settings_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_advanced_settings_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_advanced_settings_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_start_command_capture(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_start_command_capture", argc, 2);
    // coerce arguments
    const char* arg0;
    double arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_start_command_capture");
    FunctionPtr fmod_studio_system_start_command_capture = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_start_command_capture == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_start_command_capture(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_stop_command_capture(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_stop_command_capture", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_stop_command_capture");
    FunctionPtr fmod_studio_system_stop_command_capture = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_stop_command_capture == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_stop_command_capture();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_load_command_replay(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_load_command_replay", argc, 2);
    // coerce arguments
    const char* arg0;
    double arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_load_command_replay");
    FunctionPtr fmod_studio_system_load_command_replay = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_load_command_replay == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_load_command_replay(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_buffer_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_buffer_usage_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_buffer_usage_multiplatform");
    FunctionPtr fmod_studio_system_get_buffer_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_buffer_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_buffer_usage_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_reset_buffer_usage(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_reset_buffer_usage", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_reset_buffer_usage");
    FunctionPtr fmod_studio_system_reset_buffer_usage = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_reset_buffer_usage == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_reset_buffer_usage();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_cpu_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_cpu_usage_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_cpu_usage_multiplatform");
    FunctionPtr fmod_studio_system_get_cpu_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_cpu_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_cpu_usage_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_memory_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_get_memory_usage_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_memory_usage_multiplatform");
    FunctionPtr fmod_studio_system_get_memory_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_memory_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_memory_usage_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_set_callback", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_callback");
    FunctionPtr fmod_studio_system_set_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_callback(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_set_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_set_user_data");
    FunctionPtr fmod_studio_system_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_set_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_get_user_data", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_user_data");
    FunctionPtr fmod_studio_system_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_user_data();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_sound_info_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_system_get_sound_info_multiplatform", argc, 2);
    // coerce arguments
    const char* arg0;
    const char* arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_sound_info_multiplatform");
    FunctionPtr fmod_studio_system_get_sound_info_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_sound_info_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_sound_info_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_get_core_system(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_get_core_system", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_get_core_system");
    FunctionPtr fmod_studio_system_get_core_system = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_get_core_system == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_get_core_system();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_lookup_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_lookup_id", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_lookup_id");
    FunctionPtr fmod_studio_system_lookup_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_lookup_id == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_system_lookup_id(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_lookup_path(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_system_lookup_path", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_lookup_path");
    FunctionPtr fmod_studio_system_lookup_path = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_lookup_path == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_system_lookup_path(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_system_is_valid(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_studio_system_is_valid", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_system_is_valid");
    FunctionPtr fmod_studio_system_is_valid = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_system_is_valid == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_system_is_valid();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_vca_set_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_studio_vca_set_volume", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_vca_set_volume");
    FunctionPtr fmod_studio_vca_set_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_vca_set_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_vca_set_volume(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_vca_get_volume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_vca_get_volume", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_vca_get_volume");
    FunctionPtr fmod_studio_vca_get_volume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_vca_get_volume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_vca_get_volume(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_vca_get_id(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_vca_get_id", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_vca_get_id");
    FunctionPtr fmod_studio_vca_get_id = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_vca_get_id == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_vca_get_id(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_vca_get_path(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_vca_get_path", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = const char*(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_vca_get_path");
    FunctionPtr fmod_studio_vca_get_path = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_vca_get_path == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_studio_vca_get_path(arg0);
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_studio_vca_is_valid(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_studio_vca_is_valid", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_studio_vca_is_valid");
    FunctionPtr fmod_studio_vca_is_valid = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_studio_vca_is_valid == nullptr) return gmval_undefined();
    // function call
    double result = fmod_studio_vca_is_valid(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_create", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create");
    FunctionPtr fmod_system_create = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_select(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_select", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_select");
    FunctionPtr fmod_system_select = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_select == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_select(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_count(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_count", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_count");
    FunctionPtr fmod_system_count = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_count == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_count();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_init(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_init", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_init");
    FunctionPtr fmod_system_init = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_init == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_init(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_release(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_release", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_release");
    FunctionPtr fmod_system_release = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_release == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_release(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_close(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_close", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_close");
    FunctionPtr fmod_system_close = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_close == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_close(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_update_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_update_multiplatform", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_update_multiplatform");
    FunctionPtr fmod_system_update_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_update_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_update_multiplatform();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_mixer_suspend(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_mixer_suspend", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_mixer_suspend");
    FunctionPtr fmod_system_mixer_suspend = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_mixer_suspend == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_mixer_suspend();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_mixer_resume(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_mixer_resume", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_mixer_resume");
    FunctionPtr fmod_system_mixer_resume = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_mixer_resume == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_mixer_resume();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_output(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_output", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_output");
    FunctionPtr fmod_system_set_output = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_output == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_output(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_output(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_output", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_output");
    FunctionPtr fmod_system_get_output = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_output == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_output();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_num_drivers(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_num_drivers", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_num_drivers");
    FunctionPtr fmod_system_get_num_drivers = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_num_drivers == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_num_drivers();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_driver_info_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_get_driver_info_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_driver_info_multiplatform");
    FunctionPtr fmod_system_get_driver_info_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_driver_info_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_driver_info_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_driver(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_driver", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_driver");
    FunctionPtr fmod_system_set_driver = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_driver == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_driver(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_driver(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_driver", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_driver");
    FunctionPtr fmod_system_get_driver = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_driver == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_driver();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_software_channels(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_software_channels", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_software_channels");
    FunctionPtr fmod_system_set_software_channels = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_software_channels == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_software_channels(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_software_channels(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_software_channels", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_software_channels");
    FunctionPtr fmod_system_get_software_channels = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_software_channels == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_software_channels();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_software_format(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_system_set_software_format", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_software_format");
    FunctionPtr fmod_system_set_software_format = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_software_format == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_software_format(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_software_format_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_software_format_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_software_format_multiplatform");
    FunctionPtr fmod_system_get_software_format_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_software_format_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_software_format_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_dsp_buffer_size(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_set_dsp_buffer_size", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_dsp_buffer_size");
    FunctionPtr fmod_system_set_dsp_buffer_size = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_dsp_buffer_size == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_dsp_buffer_size(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_dsp_buffer_size_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_dsp_buffer_size_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_dsp_buffer_size_multiplatform");
    FunctionPtr fmod_system_get_dsp_buffer_size_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_dsp_buffer_size_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_dsp_buffer_size_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_stream_buffer_size(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_set_stream_buffer_size", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_stream_buffer_size");
    FunctionPtr fmod_system_set_stream_buffer_size = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_stream_buffer_size == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_stream_buffer_size(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_stream_buffer_size_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_stream_buffer_size_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_stream_buffer_size_multiplatform");
    FunctionPtr fmod_system_get_stream_buffer_size_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_stream_buffer_size_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_stream_buffer_size_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_advanced_settings_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_advanced_settings_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_advanced_settings_multiplatform");
    FunctionPtr fmod_system_set_advanced_settings_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_advanced_settings_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_advanced_settings_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_advanced_settings_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_advanced_settings_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_advanced_settings_multiplatform");
    FunctionPtr fmod_system_get_advanced_settings_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_advanced_settings_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_advanced_settings_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_speaker_position(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_system_set_speaker_position", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    double arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceReal(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_speaker_position");
    FunctionPtr fmod_system_set_speaker_position = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_speaker_position == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_speaker_position(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_speaker_position_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_get_speaker_position_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_speaker_position_multiplatform");
    FunctionPtr fmod_system_get_speaker_position_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_speaker_position_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_speaker_position_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_3d_settings(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_system_set_3d_settings", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_3d_settings");
    FunctionPtr fmod_system_set_3d_settings = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_3d_settings == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_3d_settings(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_3d_settings_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_3d_settings_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_3d_settings_multiplatform");
    FunctionPtr fmod_system_get_3d_settings_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_3d_settings_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_3d_settings_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_3d_num_listeners(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_3d_num_listeners", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_3d_num_listeners");
    FunctionPtr fmod_system_set_3d_num_listeners = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_3d_num_listeners == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_3d_num_listeners(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_3d_num_listeners(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_3d_num_listeners", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_3d_num_listeners");
    FunctionPtr fmod_system_get_3d_num_listeners = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_3d_num_listeners == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_3d_num_listeners();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_3d_rolloff_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_set_3d_rolloff_callback", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_3d_rolloff_callback");
    FunctionPtr fmod_system_set_3d_rolloff_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_3d_rolloff_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_3d_rolloff_callback();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_network_proxy(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_network_proxy", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_network_proxy");
    FunctionPtr fmod_system_set_network_proxy = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_network_proxy == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_network_proxy(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_network_proxy(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_network_proxy", argc, 0);
    // shared library manager block
    using FunctionPtr = const char*(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_network_proxy");
    FunctionPtr fmod_system_get_network_proxy = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_network_proxy == nullptr) return gmval_undefined();
    // function call
    const char* result = fmod_system_get_network_proxy();
    return gmval_FromString(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_network_timeout(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_network_timeout", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_network_timeout");
    FunctionPtr fmod_system_set_network_timeout = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_network_timeout == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_network_timeout(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_network_timeout(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_network_timeout", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_network_timeout");
    FunctionPtr fmod_system_get_network_timeout = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_network_timeout == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_network_timeout();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_version(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_version", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_version");
    FunctionPtr fmod_system_get_version = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_version == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_version();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_channels_playing_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_channels_playing_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_channels_playing_multiplatform");
    FunctionPtr fmod_system_get_channels_playing_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_channels_playing_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_channels_playing_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_cpu_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_cpu_usage_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_cpu_usage_multiplatform");
    FunctionPtr fmod_system_get_cpu_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_cpu_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_cpu_usage_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_file_usage_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_file_usage_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_file_usage_multiplatform");
    FunctionPtr fmod_system_get_file_usage_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_file_usage_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_file_usage_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_default_mix_matrix_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 4)
        RunnerInterface_ArgCountError("fmod_system_get_default_mix_matrix_multiplatform", argc, 4);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    const char* arg3;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    arg3 = gmval_CoerceCString(args[3]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_default_mix_matrix_multiplatform");
    FunctionPtr fmod_system_get_default_mix_matrix_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_default_mix_matrix_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_default_mix_matrix_multiplatform(arg0, arg1, arg2, arg3);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_speaker_mode_channels(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_speaker_mode_channels", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_speaker_mode_channels");
    FunctionPtr fmod_system_get_speaker_mode_channels = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_speaker_mode_channels == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_speaker_mode_channels(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create_sound_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_system_create_sound_multiplatform", argc, 3);
    // coerce arguments
    const char* arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create_sound_multiplatform");
    FunctionPtr fmod_system_create_sound_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create_sound_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create_sound_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create_stream_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_system_create_stream_multiplatform", argc, 3);
    // coerce arguments
    const char* arg0;
    double arg1;
    const char* arg2;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceCString(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create_stream_multiplatform");
    FunctionPtr fmod_system_create_stream_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create_stream_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create_stream_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create_dsp(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_create_dsp", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create_dsp");
    FunctionPtr fmod_system_create_dsp = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create_dsp == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create_dsp();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create_dsp_by_type(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_create_dsp_by_type", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create_dsp_by_type");
    FunctionPtr fmod_system_create_dsp_by_type = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create_dsp_by_type == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create_dsp_by_type(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create_channel_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_create_channel_group", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create_channel_group");
    FunctionPtr fmod_system_create_channel_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create_channel_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create_channel_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create_sound_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_create_sound_group", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create_sound_group");
    FunctionPtr fmod_system_create_sound_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create_sound_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create_sound_group(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create_reverb_3d(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_create_reverb_3d", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create_reverb_3d");
    FunctionPtr fmod_system_create_reverb_3d = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create_reverb_3d == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create_reverb_3d();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_play_sound_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_system_play_sound_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_play_sound_multiplatform");
    FunctionPtr fmod_system_play_sound_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_play_sound_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_play_sound_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_play_dsp_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_system_play_dsp_multiplatform", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_play_dsp_multiplatform");
    FunctionPtr fmod_system_play_dsp_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_play_dsp_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_play_dsp_multiplatform(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_channel(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_channel", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_channel");
    FunctionPtr fmod_system_get_channel = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_channel == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_channel(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_master_channel_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_master_channel_group", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_master_channel_group");
    FunctionPtr fmod_system_get_master_channel_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_master_channel_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_master_channel_group();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_master_sound_group(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_master_sound_group", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_master_sound_group");
    FunctionPtr fmod_system_get_master_sound_group = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_master_sound_group == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_master_sound_group();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_3d_listener_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_set_3d_listener_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_3d_listener_attributes_multiplatform");
    FunctionPtr fmod_system_set_3d_listener_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_3d_listener_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_3d_listener_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_3d_listener_attributes_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_get_3d_listener_attributes_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_3d_listener_attributes_multiplatform");
    FunctionPtr fmod_system_get_3d_listener_attributes_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_3d_listener_attributes_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_3d_listener_attributes_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_reverb_properties_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_set_reverb_properties_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_reverb_properties_multiplatform");
    FunctionPtr fmod_system_set_reverb_properties_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_reverb_properties_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_reverb_properties_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_reverb_properties_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_get_reverb_properties_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_reverb_properties_multiplatform");
    FunctionPtr fmod_system_get_reverb_properties_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_reverb_properties_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_reverb_properties_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_attach_channel_group_to_port_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_attach_channel_group_to_port_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_attach_channel_group_to_port_multiplatform");
    FunctionPtr fmod_system_attach_channel_group_to_port_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_attach_channel_group_to_port_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_attach_channel_group_to_port_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_detach_channel_group_from_port(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_detach_channel_group_from_port", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_detach_channel_group_from_port");
    FunctionPtr fmod_system_detach_channel_group_from_port = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_detach_channel_group_from_port == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_detach_channel_group_from_port(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_record_num_drivers_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_record_num_drivers_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_record_num_drivers_multiplatform");
    FunctionPtr fmod_system_get_record_num_drivers_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_record_num_drivers_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_record_num_drivers_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_record_driver_info_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_get_record_driver_info_multiplatform", argc, 2);
    // coerce arguments
    double arg0;
    const char* arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceCString(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_record_driver_info_multiplatform");
    FunctionPtr fmod_system_get_record_driver_info_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_record_driver_info_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_record_driver_info_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_record_position(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_record_position", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_record_position");
    FunctionPtr fmod_system_get_record_position = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_record_position == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_record_position(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_record_start(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 3)
        RunnerInterface_ArgCountError("fmod_system_record_start", argc, 3);
    // coerce arguments
    double arg0;
    double arg1;
    double arg2;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    arg2 = gmval_CoerceReal(args[2]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_record_start");
    FunctionPtr fmod_system_record_start = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_record_start == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_record_start(arg0, arg1, arg2);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_record_stop(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_record_stop", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_record_stop");
    FunctionPtr fmod_system_record_stop = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_record_stop == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_record_stop(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_is_recording(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_is_recording", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_is_recording");
    FunctionPtr fmod_system_is_recording = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_is_recording == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_is_recording(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_create_geometry(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_create_geometry", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_create_geometry");
    FunctionPtr fmod_system_create_geometry = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_create_geometry == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_create_geometry(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_geometry_settings(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_geometry_settings", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_geometry_settings");
    FunctionPtr fmod_system_set_geometry_settings = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_geometry_settings == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_geometry_settings(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_geometry_settings(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_get_geometry_settings", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_geometry_settings");
    FunctionPtr fmod_system_get_geometry_settings = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_geometry_settings == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_geometry_settings();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_load_geometry_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_load_geometry_multiplatform", argc, 2);
    // coerce arguments
    const char* arg0;
    double arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_load_geometry_multiplatform");
    FunctionPtr fmod_system_load_geometry_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_load_geometry_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_load_geometry_multiplatform(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_geometry_occlusion_multiplatform(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_geometry_occlusion_multiplatform", argc, 1);
    // coerce arguments
    const char* arg0;
    arg0 = gmval_CoerceCString(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_geometry_occlusion_multiplatform");
    FunctionPtr fmod_system_get_geometry_occlusion_multiplatform = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_geometry_occlusion_multiplatform == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_geometry_occlusion_multiplatform(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_lock_dsp(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_lock_dsp", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_lock_dsp");
    FunctionPtr fmod_system_lock_dsp = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_lock_dsp == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_lock_dsp();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_unlock_dsp(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_system_unlock_dsp", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_unlock_dsp");
    FunctionPtr fmod_system_unlock_dsp = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_unlock_dsp == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_unlock_dsp();
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_callback(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_set_callback", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_callback");
    FunctionPtr fmod_system_set_callback = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_callback == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_callback(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_set_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_system_set_user_data", argc, 2);
    // coerce arguments
    double arg0;
    double arg1;
    arg0 = gmval_CoerceReal(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(double, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_set_user_data");
    FunctionPtr fmod_system_set_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_set_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_set_user_data(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_system_get_user_data(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 1)
        RunnerInterface_ArgCountError("fmod_system_get_user_data", argc, 1);
    // coerce arguments
    double arg0;
    arg0 = gmval_CoerceReal(args[0]);
    // shared library manager block
    using FunctionPtr = double(*)(double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_system_get_user_data");
    FunctionPtr fmod_system_get_user_data = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_system_get_user_data == nullptr) return gmval_undefined();
    // function call
    double result = fmod_system_get_user_data(arg0);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_fetch_callbacks(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 2)
        RunnerInterface_ArgCountError("fmod_fetch_callbacks", argc, 2);
    // coerce arguments
    const char* arg0;
    double arg1;
    arg0 = gmval_CoerceCString(args[0]);
    arg1 = gmval_CoerceReal(args[1]);
    // shared library manager block
    using FunctionPtr = double(*)(const char*, double);
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_fetch_callbacks");
    FunctionPtr fmod_fetch_callbacks = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_fetch_callbacks == nullptr) return gmval_undefined();
    // function call
    double result = fmod_fetch_callbacks(arg0, arg1);
    return gmval_FromDouble(result);
}
extern "C" gmval_c __GMLIBSTUB_GMVAL__fmod_last_result(gmval_c self, gmval_c callee, int argc, gmval_c* args)
{
    if (argc < 0)
        RunnerInterface_ArgCountError("fmod_last_result", argc, 0);
    // shared library manager block
    using FunctionPtr = double(*)();
    static int32 index = SharedLibraryManager_GetFunctionIndex("FMOD", "fmod_last_result");
    FunctionPtr fmod_last_result = (FunctionPtr)SharedLibraryManager_GetFunctionByIndex(index);
    if (fmod_last_result == nullptr) return gmval_undefined();
    // function call
    double result = fmod_last_result();
    return gmval_FromDouble(result);
}
extern "C" void Setup_FMOD()
{
    RunnerInterface_AddFunction("fmod_channel_set_frequency", __GMLIBSTUB_GMVAL__fmod_channel_set_frequency, 2);
    RunnerInterface_AddFunction("fmod_channel_get_frequency", __GMLIBSTUB_GMVAL__fmod_channel_get_frequency, 1);
    RunnerInterface_AddFunction("fmod_channel_set_priority", __GMLIBSTUB_GMVAL__fmod_channel_set_priority, 2);
    RunnerInterface_AddFunction("fmod_channel_get_priority", __GMLIBSTUB_GMVAL__fmod_channel_get_priority, 1);
    RunnerInterface_AddFunction("fmod_channel_set_position", __GMLIBSTUB_GMVAL__fmod_channel_set_position, 3);
    RunnerInterface_AddFunction("fmod_channel_get_position", __GMLIBSTUB_GMVAL__fmod_channel_get_position, 2);
    RunnerInterface_AddFunction("fmod_channel_set_channel_group", __GMLIBSTUB_GMVAL__fmod_channel_set_channel_group, 2);
    RunnerInterface_AddFunction("fmod_channel_get_channel_group", __GMLIBSTUB_GMVAL__fmod_channel_get_channel_group, 1);
    RunnerInterface_AddFunction("fmod_channel_set_loop_count", __GMLIBSTUB_GMVAL__fmod_channel_set_loop_count, 2);
    RunnerInterface_AddFunction("fmod_channel_get_loop_count", __GMLIBSTUB_GMVAL__fmod_channel_get_loop_count, 1);
    RunnerInterface_AddFunction("fmod_channel_set_loop_points", __GMLIBSTUB_GMVAL__fmod_channel_set_loop_points, 5);
    RunnerInterface_AddFunction("fmod_channel_get_loop_points_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_get_loop_points_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_channel_is_virtual", __GMLIBSTUB_GMVAL__fmod_channel_is_virtual, 1);
    RunnerInterface_AddFunction("fmod_channel_get_current_sound", __GMLIBSTUB_GMVAL__fmod_channel_get_current_sound, 1);
    RunnerInterface_AddFunction("fmod_channel_get_index", __GMLIBSTUB_GMVAL__fmod_channel_get_index, 1);
    RunnerInterface_AddFunction("fmod_channel_get_system_object", __GMLIBSTUB_GMVAL__fmod_channel_get_system_object, 1);
    RunnerInterface_AddFunction("fmod_channel_control_is_playing", __GMLIBSTUB_GMVAL__fmod_channel_control_is_playing, 1);
    RunnerInterface_AddFunction("fmod_channel_control_stop", __GMLIBSTUB_GMVAL__fmod_channel_control_stop, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_paused", __GMLIBSTUB_GMVAL__fmod_channel_control_set_paused, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_paused", __GMLIBSTUB_GMVAL__fmod_channel_control_get_paused, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_mode", __GMLIBSTUB_GMVAL__fmod_channel_control_set_mode, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_mode", __GMLIBSTUB_GMVAL__fmod_channel_control_get_mode, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_pitch", __GMLIBSTUB_GMVAL__fmod_channel_control_set_pitch, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_pitch", __GMLIBSTUB_GMVAL__fmod_channel_control_get_pitch, 1);
    RunnerInterface_AddFunction("fmod_channel_control_get_audibility", __GMLIBSTUB_GMVAL__fmod_channel_control_get_audibility, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_volume", __GMLIBSTUB_GMVAL__fmod_channel_control_set_volume, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_volume", __GMLIBSTUB_GMVAL__fmod_channel_control_get_volume, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_volume_ramp", __GMLIBSTUB_GMVAL__fmod_channel_control_set_volume_ramp, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_volume_ramp", __GMLIBSTUB_GMVAL__fmod_channel_control_get_volume_ramp, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_mute", __GMLIBSTUB_GMVAL__fmod_channel_control_set_mute, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_mute", __GMLIBSTUB_GMVAL__fmod_channel_control_get_mute, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_cone_orientation_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_cone_orientation_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_cone_orientation_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_cone_orientation_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_cone_settings", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_cone_settings, 4);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_cone_settings_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_cone_settings_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_custom_rolloff_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_custom_rolloff_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_custom_rolloff_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_custom_rolloff_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_distance_filter", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_distance_filter, 4);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_distance_filter_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_distance_filter_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_doppler_level", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_doppler_level, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_doppler_level", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_doppler_level, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_level", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_level, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_level", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_level, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_min_max_distance", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_min_max_distance, 3);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_min_max_distance_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_min_max_distance_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_occlusion", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_occlusion, 3);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_occlusion_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_occlusion_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_3d_spread", __GMLIBSTUB_GMVAL__fmod_channel_control_set_3d_spread, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_3d_spread", __GMLIBSTUB_GMVAL__fmod_channel_control_get_3d_spread, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_pan", __GMLIBSTUB_GMVAL__fmod_channel_control_set_pan, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_mix_levels_input_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_set_mix_levels_input_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_mix_levels_output", __GMLIBSTUB_GMVAL__fmod_channel_control_set_mix_levels_output, 9);
    RunnerInterface_AddFunction("fmod_channel_control_set_mix_matrix_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_set_mix_matrix_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_mix_matrix_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_mix_matrix_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_channel_control_set_reverb_properties", __GMLIBSTUB_GMVAL__fmod_channel_control_set_reverb_properties, 3);
    RunnerInterface_AddFunction("fmod_channel_control_get_reverb_properties", __GMLIBSTUB_GMVAL__fmod_channel_control_get_reverb_properties, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_low_pass_gain", __GMLIBSTUB_GMVAL__fmod_channel_control_set_low_pass_gain, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_low_pass_gain", __GMLIBSTUB_GMVAL__fmod_channel_control_get_low_pass_gain, 1);
    RunnerInterface_AddFunction("fmod_channel_control_add_dsp", __GMLIBSTUB_GMVAL__fmod_channel_control_add_dsp, 3);
    RunnerInterface_AddFunction("fmod_channel_control_remove_dsp", __GMLIBSTUB_GMVAL__fmod_channel_control_remove_dsp, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_num_dsps", __GMLIBSTUB_GMVAL__fmod_channel_control_get_num_dsps, 1);
    RunnerInterface_AddFunction("fmod_channel_control_get_dsp", __GMLIBSTUB_GMVAL__fmod_channel_control_get_dsp, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_dsp_index", __GMLIBSTUB_GMVAL__fmod_channel_control_set_dsp_index, 3);
    RunnerInterface_AddFunction("fmod_channel_control_get_dsp_index", __GMLIBSTUB_GMVAL__fmod_channel_control_get_dsp_index, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_dsp_clock_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_dsp_clock_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_delay_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_set_delay_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_delay_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_delay_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_add_fade_point_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_add_fade_point_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_fade_point_ramp_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_set_fade_point_ramp_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_remove_fade_points_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_remove_fade_points_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_fade_points_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_control_get_fade_points_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_channel_control_set_callback", __GMLIBSTUB_GMVAL__fmod_channel_control_set_callback, 1);
    RunnerInterface_AddFunction("fmod_channel_control_get_system_object", __GMLIBSTUB_GMVAL__fmod_channel_control_get_system_object, 1);
    RunnerInterface_AddFunction("fmod_channel_control_set_user_data", __GMLIBSTUB_GMVAL__fmod_channel_control_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_channel_control_get_user_data", __GMLIBSTUB_GMVAL__fmod_channel_control_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_channel_group_get_num_channels", __GMLIBSTUB_GMVAL__fmod_channel_group_get_num_channels, 1);
    RunnerInterface_AddFunction("fmod_channel_group_get_channel", __GMLIBSTUB_GMVAL__fmod_channel_group_get_channel, 2);
    RunnerInterface_AddFunction("fmod_channel_group_add_group_multiplatform", __GMLIBSTUB_GMVAL__fmod_channel_group_add_group_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_channel_group_get_num_groups", __GMLIBSTUB_GMVAL__fmod_channel_group_get_num_groups, 1);
    RunnerInterface_AddFunction("fmod_channel_group_get_group", __GMLIBSTUB_GMVAL__fmod_channel_group_get_group, 2);
    RunnerInterface_AddFunction("fmod_channel_group_get_parent_group", __GMLIBSTUB_GMVAL__fmod_channel_group_get_parent_group, 1);
    RunnerInterface_AddFunction("fmod_channel_group_get_name", __GMLIBSTUB_GMVAL__fmod_channel_group_get_name, 1);
    RunnerInterface_AddFunction("fmod_channel_group_release", __GMLIBSTUB_GMVAL__fmod_channel_group_release, 1);
    RunnerInterface_AddFunction("fmod_channel_group_get_system_object", __GMLIBSTUB_GMVAL__fmod_channel_group_get_system_object, 1);
    RunnerInterface_AddFunction("fmod_file_get_disk_busy", __GMLIBSTUB_GMVAL__fmod_file_get_disk_busy, 0);
    RunnerInterface_AddFunction("fmod_file_set_disk_busy", __GMLIBSTUB_GMVAL__fmod_file_set_disk_busy, 1);
    RunnerInterface_AddFunction("fmod_memory_get_stats_multiplatform", __GMLIBSTUB_GMVAL__fmod_memory_get_stats_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_debug_initialize_multiplatform", __GMLIBSTUB_GMVAL__fmod_debug_initialize_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_thread_set_attributes", __GMLIBSTUB_GMVAL__fmod_thread_set_attributes, 4);
    RunnerInterface_AddFunction("fmod_dsp_add_input_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_add_input_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_input_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_input_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_output_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_output_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_num_inputs", __GMLIBSTUB_GMVAL__fmod_dsp_get_num_inputs, 1);
    RunnerInterface_AddFunction("fmod_dsp_get_num_outputs", __GMLIBSTUB_GMVAL__fmod_dsp_get_num_outputs, 1);
    RunnerInterface_AddFunction("fmod_dsp_disconnect_all", __GMLIBSTUB_GMVAL__fmod_dsp_disconnect_all, 3);
    RunnerInterface_AddFunction("fmod_dsp_disconnect_from_mutliplatform", __GMLIBSTUB_GMVAL__fmod_dsp_disconnect_from_mutliplatform, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_data_parameter_index", __GMLIBSTUB_GMVAL__fmod_dsp_get_data_parameter_index, 2);
    RunnerInterface_AddFunction("fmod_dsp_get_num_parameters", __GMLIBSTUB_GMVAL__fmod_dsp_get_num_parameters, 1);
    RunnerInterface_AddFunction("fmod_dsp_set_parameter_bool", __GMLIBSTUB_GMVAL__fmod_dsp_set_parameter_bool, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_parameter_bool", __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_bool, 2);
    RunnerInterface_AddFunction("fmod_dsp_set_parameter_data_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_set_parameter_data_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_dsp_get_parameter_data_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_data_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_dsp_set_parameter_float", __GMLIBSTUB_GMVAL__fmod_dsp_set_parameter_float, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_parameter_float", __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_float, 2);
    RunnerInterface_AddFunction("fmod_dsp_set_parameter_int", __GMLIBSTUB_GMVAL__fmod_dsp_set_parameter_int, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_parameter_int", __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_int, 2);
    RunnerInterface_AddFunction("fmod_dsp_get_parameter_info_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_parameter_info_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_dsp_set_channel_format", __GMLIBSTUB_GMVAL__fmod_dsp_set_channel_format, 4);
    RunnerInterface_AddFunction("fmod_dsp_get_channel_format_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_channel_format_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_dsp_get_output_channel_format_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_output_channel_format_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_metering_info_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_metering_info_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_dsp_set_metering_enabled", __GMLIBSTUB_GMVAL__fmod_dsp_set_metering_enabled, 3);
    RunnerInterface_AddFunction("fmod_dsp_get_metering_enabled_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_metering_enabled_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_dsp_set_active", __GMLIBSTUB_GMVAL__fmod_dsp_set_active, 2);
    RunnerInterface_AddFunction("fmod_dsp_get_active", __GMLIBSTUB_GMVAL__fmod_dsp_get_active, 1);
    RunnerInterface_AddFunction("fmod_dsp_set_bypass", __GMLIBSTUB_GMVAL__fmod_dsp_set_bypass, 2);
    RunnerInterface_AddFunction("fmod_dsp_get_bypass", __GMLIBSTUB_GMVAL__fmod_dsp_get_bypass, 1);
    RunnerInterface_AddFunction("fmod_dsp_set_wet_dry_mix", __GMLIBSTUB_GMVAL__fmod_dsp_set_wet_dry_mix, 4);
    RunnerInterface_AddFunction("fmod_dsp_get_wet_dry_mix_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_wet_dry_mix_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_dsp_get_idle", __GMLIBSTUB_GMVAL__fmod_dsp_get_idle, 1);
    RunnerInterface_AddFunction("fmod_dsp_reset", __GMLIBSTUB_GMVAL__fmod_dsp_reset, 1);
    RunnerInterface_AddFunction("fmod_dsp_release", __GMLIBSTUB_GMVAL__fmod_dsp_release, 1);
    RunnerInterface_AddFunction("fmod_dsp_get_type", __GMLIBSTUB_GMVAL__fmod_dsp_get_type, 1);
    RunnerInterface_AddFunction("fmod_dsp_get_info_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_info_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_dsp_get_cpu_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_get_cpu_usage_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_dsp_set_user_data", __GMLIBSTUB_GMVAL__fmod_dsp_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_dsp_get_user_data", __GMLIBSTUB_GMVAL__fmod_dsp_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_dsp_set_callback", __GMLIBSTUB_GMVAL__fmod_dsp_set_callback, 1);
    RunnerInterface_AddFunction("fmod_dsp_get_system_object", __GMLIBSTUB_GMVAL__fmod_dsp_get_system_object, 1);
    RunnerInterface_AddFunction("fmod_dsp_connection_set_mix", __GMLIBSTUB_GMVAL__fmod_dsp_connection_set_mix, 2);
    RunnerInterface_AddFunction("fmod_dsp_connection_get_mix", __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_mix, 1);
    RunnerInterface_AddFunction("fmod_dsp_connection_set_mix_matrix_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_connection_set_mix_matrix_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_dsp_connection_get_mix_matrix_multiplatform", __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_mix_matrix_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_dsp_connection_get_input", __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_input, 1);
    RunnerInterface_AddFunction("fmod_dsp_connection_get_output", __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_output, 1);
    RunnerInterface_AddFunction("fmod_dsp_connection_get_type", __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_type, 1);
    RunnerInterface_AddFunction("fmod_dsp_connection_set_user_data", __GMLIBSTUB_GMVAL__fmod_dsp_connection_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_dsp_connection_get_user_data", __GMLIBSTUB_GMVAL__fmod_dsp_connection_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_geometry_set_polygon_attributes", __GMLIBSTUB_GMVAL__fmod_geometry_set_polygon_attributes, 5);
    RunnerInterface_AddFunction("fmod_geometry_get_polygon_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_get_polygon_attributes_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_geometry_get_polygon_num_vertices", __GMLIBSTUB_GMVAL__fmod_geometry_get_polygon_num_vertices, 2);
    RunnerInterface_AddFunction("fmod_geometry_set_polygon_vertex_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_set_polygon_vertex_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_geometry_get_polygon_vertex_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_get_polygon_vertex_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_geometry_set_position_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_set_position_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_geometry_get_position_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_get_position_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_geometry_set_rotation_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_set_rotation_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_geometry_get_rotation_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_get_rotation_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_geometry_set_scale_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_set_scale_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_geometry_get_scale_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_get_scale_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_geometry_add_polygon_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_add_polygon_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_geometry_set_active", __GMLIBSTUB_GMVAL__fmod_geometry_set_active, 2);
    RunnerInterface_AddFunction("fmod_geometry_get_active", __GMLIBSTUB_GMVAL__fmod_geometry_get_active, 1);
    RunnerInterface_AddFunction("fmod_geometry_get_max_polygons_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_get_max_polygons_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_geometry_get_num_polygons", __GMLIBSTUB_GMVAL__fmod_geometry_get_num_polygons, 1);
    RunnerInterface_AddFunction("fmod_geometry_set_user_data", __GMLIBSTUB_GMVAL__fmod_geometry_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_geometry_get_user_data", __GMLIBSTUB_GMVAL__fmod_geometry_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_geometry_release", __GMLIBSTUB_GMVAL__fmod_geometry_release, 1);
    RunnerInterface_AddFunction("fmod_geometry_save_multiplatform", __GMLIBSTUB_GMVAL__fmod_geometry_save_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_reverb_3d_set_3d_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_reverb_3d_set_3d_attributes_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_reverb_3d_get_3d_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_reverb_3d_get_3d_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_reverb_3d_set_properties", __GMLIBSTUB_GMVAL__fmod_reverb_3d_set_properties, 13);
    RunnerInterface_AddFunction("fmod_reverb_3d_get_properties_multiplatform", __GMLIBSTUB_GMVAL__fmod_reverb_3d_get_properties_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_reverb_3d_set_active", __GMLIBSTUB_GMVAL__fmod_reverb_3d_set_active, 2);
    RunnerInterface_AddFunction("fmod_reverb_3d_get_active", __GMLIBSTUB_GMVAL__fmod_reverb_3d_get_active, 1);
    RunnerInterface_AddFunction("fmod_reverb_3d_release", __GMLIBSTUB_GMVAL__fmod_reverb_3d_release, 1);
    RunnerInterface_AddFunction("fmod_reverb_3d_set_user_data", __GMLIBSTUB_GMVAL__fmod_reverb_3d_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_reverb_3d_get_user_data", __GMLIBSTUB_GMVAL__fmod_reverb_3d_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_sound_get_name", __GMLIBSTUB_GMVAL__fmod_sound_get_name, 1);
    RunnerInterface_AddFunction("fmod_sound_get_format_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_format_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_get_length", __GMLIBSTUB_GMVAL__fmod_sound_get_length, 2);
    RunnerInterface_AddFunction("fmod_sound_get_num_tags_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_num_tags_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_get_tag_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_tag_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_sound_set_3d_cone_settings", __GMLIBSTUB_GMVAL__fmod_sound_set_3d_cone_settings, 4);
    RunnerInterface_AddFunction("fmod_sound_get_3d_cone_settings_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_3d_cone_settings_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_set_3d_custom_rolloff_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_set_3d_custom_rolloff_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_get_3d_custom_rolloff_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_3d_custom_rolloff_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_set_3d_min_max_distance", __GMLIBSTUB_GMVAL__fmod_sound_set_3d_min_max_distance, 3);
    RunnerInterface_AddFunction("fmod_sound_get_3d_min_max_distance_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_3d_min_max_distance_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_set_defaults", __GMLIBSTUB_GMVAL__fmod_sound_set_defaults, 3);
    RunnerInterface_AddFunction("fmod_sound_get_defaults_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_defaults_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_set_mode", __GMLIBSTUB_GMVAL__fmod_sound_set_mode, 2);
    RunnerInterface_AddFunction("fmod_sound_get_mode", __GMLIBSTUB_GMVAL__fmod_sound_get_mode, 1);
    RunnerInterface_AddFunction("fmod_sound_set_loop_count", __GMLIBSTUB_GMVAL__fmod_sound_set_loop_count, 2);
    RunnerInterface_AddFunction("fmod_sound_get_loop_count", __GMLIBSTUB_GMVAL__fmod_sound_get_loop_count, 1);
    RunnerInterface_AddFunction("fmod_sound_set_loop_points", __GMLIBSTUB_GMVAL__fmod_sound_set_loop_points, 5);
    RunnerInterface_AddFunction("fmod_sound_get_loop_points_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_loop_points_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_sound_set_sound_group", __GMLIBSTUB_GMVAL__fmod_sound_set_sound_group, 2);
    RunnerInterface_AddFunction("fmod_sound_get_sound_group", __GMLIBSTUB_GMVAL__fmod_sound_get_sound_group, 1);
    RunnerInterface_AddFunction("fmod_sound_get_num_sub_sounds", __GMLIBSTUB_GMVAL__fmod_sound_get_num_sub_sounds, 1);
    RunnerInterface_AddFunction("fmod_sound_get_sub_sound", __GMLIBSTUB_GMVAL__fmod_sound_get_sub_sound, 2);
    RunnerInterface_AddFunction("fmod_sound_get_sub_sound_parent", __GMLIBSTUB_GMVAL__fmod_sound_get_sub_sound_parent, 1);
    RunnerInterface_AddFunction("fmod_sound_get_open_state_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_open_state_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_read_data_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_read_data_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_seek_data", __GMLIBSTUB_GMVAL__fmod_sound_seek_data, 2);
    RunnerInterface_AddFunction("fmod_sound_lock_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_lock_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_sound_unlock_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_unlock_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_sound_get_music_num_channels", __GMLIBSTUB_GMVAL__fmod_sound_get_music_num_channels, 1);
    RunnerInterface_AddFunction("fmod_sound_set_music_channel_volume", __GMLIBSTUB_GMVAL__fmod_sound_set_music_channel_volume, 3);
    RunnerInterface_AddFunction("fmod_sound_get_music_channel_volume", __GMLIBSTUB_GMVAL__fmod_sound_get_music_channel_volume, 2);
    RunnerInterface_AddFunction("fmod_sound_set_music_speed", __GMLIBSTUB_GMVAL__fmod_sound_set_music_speed, 2);
    RunnerInterface_AddFunction("fmod_sound_get_music_speed", __GMLIBSTUB_GMVAL__fmod_sound_get_music_speed, 1);
    RunnerInterface_AddFunction("fmod_sound_get_sync_point_multiplatform", __GMLIBSTUB_GMVAL__fmod_sound_get_sync_point_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_sound_get_num_sync_points", __GMLIBSTUB_GMVAL__fmod_sound_get_num_sync_points, 1);
    RunnerInterface_AddFunction("fmod_sound_add_sync_point", __GMLIBSTUB_GMVAL__fmod_sound_add_sync_point, 4);
    RunnerInterface_AddFunction("fmod_sound_delete_sync_point", __GMLIBSTUB_GMVAL__fmod_sound_delete_sync_point, 2);
    RunnerInterface_AddFunction("fmod_sound_release", __GMLIBSTUB_GMVAL__fmod_sound_release, 1);
    RunnerInterface_AddFunction("fmod_sound_get_system_object", __GMLIBSTUB_GMVAL__fmod_sound_get_system_object, 1);
    RunnerInterface_AddFunction("fmod_sound_set_user_data", __GMLIBSTUB_GMVAL__fmod_sound_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_sound_get_user_data", __GMLIBSTUB_GMVAL__fmod_sound_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_sound_group_set_max_audible", __GMLIBSTUB_GMVAL__fmod_sound_group_set_max_audible, 2);
    RunnerInterface_AddFunction("fmod_sound_group_get_max_audible", __GMLIBSTUB_GMVAL__fmod_sound_group_get_max_audible, 1);
    RunnerInterface_AddFunction("fmod_sound_group_set_max_audible_behavior", __GMLIBSTUB_GMVAL__fmod_sound_group_set_max_audible_behavior, 2);
    RunnerInterface_AddFunction("fmod_sound_group_get_max_audible_behavior", __GMLIBSTUB_GMVAL__fmod_sound_group_get_max_audible_behavior, 1);
    RunnerInterface_AddFunction("fmod_sound_group_set_mute_fade_speed", __GMLIBSTUB_GMVAL__fmod_sound_group_set_mute_fade_speed, 2);
    RunnerInterface_AddFunction("fmod_sound_group_get_mute_fade_speed", __GMLIBSTUB_GMVAL__fmod_sound_group_get_mute_fade_speed, 1);
    RunnerInterface_AddFunction("fmod_sound_group_set_volume", __GMLIBSTUB_GMVAL__fmod_sound_group_set_volume, 2);
    RunnerInterface_AddFunction("fmod_sound_group_get_volume", __GMLIBSTUB_GMVAL__fmod_sound_group_get_volume, 1);
    RunnerInterface_AddFunction("fmod_sound_group_get_num_sounds", __GMLIBSTUB_GMVAL__fmod_sound_group_get_num_sounds, 1);
    RunnerInterface_AddFunction("fmod_sound_group_get_sound", __GMLIBSTUB_GMVAL__fmod_sound_group_get_sound, 2);
    RunnerInterface_AddFunction("fmod_sound_group_get_num_playing", __GMLIBSTUB_GMVAL__fmod_sound_group_get_num_playing, 1);
    RunnerInterface_AddFunction("fmod_sound_group_stop", __GMLIBSTUB_GMVAL__fmod_sound_group_stop, 1);
    RunnerInterface_AddFunction("fmod_sound_group_get_name", __GMLIBSTUB_GMVAL__fmod_sound_group_get_name, 1);
    RunnerInterface_AddFunction("fmod_sound_group_release", __GMLIBSTUB_GMVAL__fmod_sound_group_release, 1);
    RunnerInterface_AddFunction("fmod_sound_group_get_system_object", __GMLIBSTUB_GMVAL__fmod_sound_group_get_system_object, 1);
    RunnerInterface_AddFunction("fmod_sound_group_set_user_data", __GMLIBSTUB_GMVAL__fmod_sound_group_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_sound_group_get_user_data", __GMLIBSTUB_GMVAL__fmod_sound_group_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_get_loading_state", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_loading_state, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_load_sample_data", __GMLIBSTUB_GMVAL__fmod_studio_bank_load_sample_data, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_unload_sample_data", __GMLIBSTUB_GMVAL__fmod_studio_bank_unload_sample_data, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_get_sample_loading_state", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_sample_loading_state, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_unload", __GMLIBSTUB_GMVAL__fmod_studio_bank_unload, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_get_bus_count", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_bus_count, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_get_bus_list_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_bus_list_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_bank_get_event_count", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_event_count, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_get_event_description_list_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_event_description_list_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_bank_get_string_count", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_string_count, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_get_string_info_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_string_info_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_bank_get_vca_count", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_vca_count, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_get_vca_list_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_vca_list_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_bank_get_id", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_id, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_get_path", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_path, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_is_valid", __GMLIBSTUB_GMVAL__fmod_studio_bank_is_valid, 1);
    RunnerInterface_AddFunction("fmod_studio_bank_set_user_data", __GMLIBSTUB_GMVAL__fmod_studio_bank_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_studio_bank_get_user_data", __GMLIBSTUB_GMVAL__fmod_studio_bank_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_set_paused", __GMLIBSTUB_GMVAL__fmod_studio_bus_set_paused, 2);
    RunnerInterface_AddFunction("fmod_studio_bus_get_paused", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_paused, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_stop_all_events", __GMLIBSTUB_GMVAL__fmod_studio_bus_stop_all_events, 2);
    RunnerInterface_AddFunction("fmod_studio_bus_set_volume", __GMLIBSTUB_GMVAL__fmod_studio_bus_set_volume, 2);
    RunnerInterface_AddFunction("fmod_studio_bus_get_volume", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_volume, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_set_mute", __GMLIBSTUB_GMVAL__fmod_studio_bus_set_mute, 2);
    RunnerInterface_AddFunction("fmod_studio_bus_get_mute", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_mute, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_set_port_index_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_bus_set_port_index_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_bus_get_port_index_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_port_index_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_bus_get_channel_group", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_channel_group, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_lock_channel_group", __GMLIBSTUB_GMVAL__fmod_studio_bus_lock_channel_group, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_unlock_channel_group", __GMLIBSTUB_GMVAL__fmod_studio_bus_unlock_channel_group, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_get_cpu_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_cpu_usage_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_bus_get_memory_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_memory_usage_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_bus_get_id", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_id, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_get_path", __GMLIBSTUB_GMVAL__fmod_studio_bus_get_path, 1);
    RunnerInterface_AddFunction("fmod_studio_bus_is_valid", __GMLIBSTUB_GMVAL__fmod_studio_bus_is_valid, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_set_bank_path", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_bank_path, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_set_create_instance_callback", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_create_instance_callback, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_set_frame_callback", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_frame_callback, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_set_load_bank_callback", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_load_bank_callback, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_start", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_start, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_stop", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_stop, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_current_command_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_current_command_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_playback_state", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_playback_state, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_set_paused", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_paused, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_paused", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_paused, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_seek_to_command", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_seek_to_command, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_seek_to_time", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_seek_to_time, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_command_at_time", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_command_at_time, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_command_count", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_command_count, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_command_info_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_command_info_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_command_string", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_command_string, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_length", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_length, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_system_object", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_system_object, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_is_valid", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_is_valid, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_set_user_data", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_studio_command_replay_get_user_data", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_studio_command_replay_release", __GMLIBSTUB_GMVAL__fmod_studio_command_replay_release, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_create_instance", __GMLIBSTUB_GMVAL__fmod_studio_event_description_create_instance, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_instance_count", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_instance_count, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_instance_list_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_instance_list_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_event_description_release_all_instances", __GMLIBSTUB_GMVAL__fmod_studio_event_description_release_all_instances, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_load_sample_data", __GMLIBSTUB_GMVAL__fmod_studio_event_description_load_sample_data, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_unload_sample_data", __GMLIBSTUB_GMVAL__fmod_studio_event_description_unload_sample_data, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_sample_loading_state", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_sample_loading_state, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_is_3d", __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_3d, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_is_doppler_enabled", __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_doppler_enabled, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_is_oneshot", __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_oneshot, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_is_snapshot", __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_snapshot, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_is_stream", __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_stream, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_has_sustain_point", __GMLIBSTUB_GMVAL__fmod_studio_event_description_has_sustain_point, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_min_max_distance_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_min_max_distance_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_sound_size", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_sound_size, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_parameter_description_by_name_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_description_by_name_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_parameter_description_by_id_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_description_by_id_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_parameter_description_by_index_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_description_by_index_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_parameter_description_count", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_description_count, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_parameter_label_by_name", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_label_by_name, 3);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_parameter_label_by_id_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_label_by_id_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_parameter_label_by_index", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_parameter_label_by_index, 3);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_user_property_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_user_property_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_user_property_by_index_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_user_property_by_index_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_user_property_count", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_user_property_count, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_id", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_id, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_length", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_length, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_path", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_path, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_set_callback", __GMLIBSTUB_GMVAL__fmod_studio_event_description_set_callback, 2);
    RunnerInterface_AddFunction("fmod_studio_event_description_set_user_data", __GMLIBSTUB_GMVAL__fmod_studio_event_description_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_studio_event_description_get_user_data", __GMLIBSTUB_GMVAL__fmod_studio_event_description_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_studio_event_description_is_valid", __GMLIBSTUB_GMVAL__fmod_studio_event_description_is_valid, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_start", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_start, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_stop", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_stop, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_playback_state", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_playback_state, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_paused", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_paused, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_paused", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_paused, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_keyoff", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_keyoff, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_pitch", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_pitch, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_pitch", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_pitch, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_property", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_property, 3);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_property", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_property, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_timeline_position", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_timeline_position, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_timeline_position", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_timeline_position, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_volume", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_volume, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_volume_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_volume_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_is_virtual", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_is_virtual, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_3d_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_3d_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_3d_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_3d_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_listener_mask", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_listener_mask, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_listener_mask", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_listener_mask, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_min_max_distance_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_min_max_distance_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_parameter_by_name_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_parameter_by_name_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_parameter_by_name_with_label", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_parameter_by_name_with_label, 4);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_parameter_by_name_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_parameter_by_name_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_parameter_by_id_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_parameter_by_id_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_parameter_by_id_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_parameter_by_id_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_channel_group", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_channel_group, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_reverb_level", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_reverb_level, 3);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_reverb_level", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_reverb_level, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_cpu_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_cpu_usage_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_memory_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_memory_usage_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_callback", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_callback, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_set_user_data", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_user_data", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_get_description", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_get_description, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_release", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_release, 1);
    RunnerInterface_AddFunction("fmod_studio_event_instance_is_valid", __GMLIBSTUB_GMVAL__fmod_studio_event_instance_is_valid, 1);
    RunnerInterface_AddFunction("fmod_studio_system_create", __GMLIBSTUB_GMVAL__fmod_studio_system_create, 0);
    RunnerInterface_AddFunction("fmod_studio_system_init", __GMLIBSTUB_GMVAL__fmod_studio_system_init, 3);
    RunnerInterface_AddFunction("fmod_studio_system_release", __GMLIBSTUB_GMVAL__fmod_studio_system_release, 0);
    RunnerInterface_AddFunction("fmod_studio_system_update_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_update_multiplatform, 0);
    RunnerInterface_AddFunction("fmod_studio_system_flush_commands", __GMLIBSTUB_GMVAL__fmod_studio_system_flush_commands, 0);
    RunnerInterface_AddFunction("fmod_studio_system_flush_sample_loading", __GMLIBSTUB_GMVAL__fmod_studio_system_flush_sample_loading, 0);
    RunnerInterface_AddFunction("fmod_studio_system_load_bank_custom", __GMLIBSTUB_GMVAL__fmod_studio_system_load_bank_custom, 1);
    RunnerInterface_AddFunction("fmod_studio_system_load_bank_file", __GMLIBSTUB_GMVAL__fmod_studio_system_load_bank_file, 2);
    RunnerInterface_AddFunction("fmod_studio_system_load_bank_memory_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_load_bank_memory_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_studio_system_unload_all", __GMLIBSTUB_GMVAL__fmod_studio_system_unload_all, 0);
    RunnerInterface_AddFunction("fmod_studio_system_get_bank", __GMLIBSTUB_GMVAL__fmod_studio_system_get_bank, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_bank_by_id", __GMLIBSTUB_GMVAL__fmod_studio_system_get_bank_by_id, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_bank_count", __GMLIBSTUB_GMVAL__fmod_studio_system_get_bank_count, 0);
    RunnerInterface_AddFunction("fmod_studio_system_get_bank_list_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_bank_list_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_studio_system_set_listener_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_set_listener_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_system_get_listener_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_listener_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_system_set_listener_weight", __GMLIBSTUB_GMVAL__fmod_studio_system_set_listener_weight, 2);
    RunnerInterface_AddFunction("fmod_studio_system_get_listener_weight", __GMLIBSTUB_GMVAL__fmod_studio_system_get_listener_weight, 1);
    RunnerInterface_AddFunction("fmod_studio_system_set_num_listeners", __GMLIBSTUB_GMVAL__fmod_studio_system_set_num_listeners, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_num_listeners", __GMLIBSTUB_GMVAL__fmod_studio_system_get_num_listeners, 0);
    RunnerInterface_AddFunction("fmod_studio_system_get_bus", __GMLIBSTUB_GMVAL__fmod_studio_system_get_bus, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_bus_by_id", __GMLIBSTUB_GMVAL__fmod_studio_system_get_bus_by_id, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_event", __GMLIBSTUB_GMVAL__fmod_studio_system_get_event, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_event_by_id", __GMLIBSTUB_GMVAL__fmod_studio_system_get_event_by_id, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_parameter_by_id_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_by_id_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_system_set_parameter_by_id_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_set_parameter_by_id_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_system_set_parameter_by_id_with_label_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_set_parameter_by_id_with_label_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_system_get_parameter_by_name_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_by_name_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_system_set_parameter_by_name_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_set_parameter_by_name_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_system_set_parameter_by_name_with_label_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_set_parameter_by_name_with_label_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_studio_system_get_parameter_description_by_name_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_description_by_name_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_system_get_parameter_description_by_id_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_description_by_id_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_system_get_parameter_description_count", __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_description_count, 0);
    RunnerInterface_AddFunction("fmod_studio_system_get_parameter_description_list_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_description_list_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_parameter_label_by_name", __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_label_by_name, 2);
    RunnerInterface_AddFunction("fmod_studio_system_get_parameter_label_by_id_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_parameter_label_by_id_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_system_get_vca", __GMLIBSTUB_GMVAL__fmod_studio_system_get_vca, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_vca_by_id", __GMLIBSTUB_GMVAL__fmod_studio_system_get_vca_by_id, 1);
    RunnerInterface_AddFunction("fmod_studio_system_set_advanced_settings_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_set_advanced_settings_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_advanced_settings_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_advanced_settings_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_studio_system_start_command_capture", __GMLIBSTUB_GMVAL__fmod_studio_system_start_command_capture, 2);
    RunnerInterface_AddFunction("fmod_studio_system_stop_command_capture", __GMLIBSTUB_GMVAL__fmod_studio_system_stop_command_capture, 0);
    RunnerInterface_AddFunction("fmod_studio_system_load_command_replay", __GMLIBSTUB_GMVAL__fmod_studio_system_load_command_replay, 2);
    RunnerInterface_AddFunction("fmod_studio_system_get_buffer_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_buffer_usage_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_studio_system_reset_buffer_usage", __GMLIBSTUB_GMVAL__fmod_studio_system_reset_buffer_usage, 0);
    RunnerInterface_AddFunction("fmod_studio_system_get_cpu_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_cpu_usage_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_memory_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_memory_usage_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_studio_system_set_callback", __GMLIBSTUB_GMVAL__fmod_studio_system_set_callback, 1);
    RunnerInterface_AddFunction("fmod_studio_system_set_user_data", __GMLIBSTUB_GMVAL__fmod_studio_system_set_user_data, 1);
    RunnerInterface_AddFunction("fmod_studio_system_get_user_data", __GMLIBSTUB_GMVAL__fmod_studio_system_get_user_data, 0);
    RunnerInterface_AddFunction("fmod_studio_system_get_sound_info_multiplatform", __GMLIBSTUB_GMVAL__fmod_studio_system_get_sound_info_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_studio_system_get_core_system", __GMLIBSTUB_GMVAL__fmod_studio_system_get_core_system, 0);
    RunnerInterface_AddFunction("fmod_studio_system_lookup_id", __GMLIBSTUB_GMVAL__fmod_studio_system_lookup_id, 1);
    RunnerInterface_AddFunction("fmod_studio_system_lookup_path", __GMLIBSTUB_GMVAL__fmod_studio_system_lookup_path, 1);
    RunnerInterface_AddFunction("fmod_studio_system_is_valid", __GMLIBSTUB_GMVAL__fmod_studio_system_is_valid, 0);
    RunnerInterface_AddFunction("fmod_studio_vca_set_volume", __GMLIBSTUB_GMVAL__fmod_studio_vca_set_volume, 2);
    RunnerInterface_AddFunction("fmod_studio_vca_get_volume", __GMLIBSTUB_GMVAL__fmod_studio_vca_get_volume, 1);
    RunnerInterface_AddFunction("fmod_studio_vca_get_id", __GMLIBSTUB_GMVAL__fmod_studio_vca_get_id, 1);
    RunnerInterface_AddFunction("fmod_studio_vca_get_path", __GMLIBSTUB_GMVAL__fmod_studio_vca_get_path, 1);
    RunnerInterface_AddFunction("fmod_studio_vca_is_valid", __GMLIBSTUB_GMVAL__fmod_studio_vca_is_valid, 1);
    RunnerInterface_AddFunction("fmod_system_create", __GMLIBSTUB_GMVAL__fmod_system_create, 0);
    RunnerInterface_AddFunction("fmod_system_select", __GMLIBSTUB_GMVAL__fmod_system_select, 1);
    RunnerInterface_AddFunction("fmod_system_count", __GMLIBSTUB_GMVAL__fmod_system_count, 0);
    RunnerInterface_AddFunction("fmod_system_init", __GMLIBSTUB_GMVAL__fmod_system_init, 2);
    RunnerInterface_AddFunction("fmod_system_release", __GMLIBSTUB_GMVAL__fmod_system_release, 1);
    RunnerInterface_AddFunction("fmod_system_close", __GMLIBSTUB_GMVAL__fmod_system_close, 1);
    RunnerInterface_AddFunction("fmod_system_update_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_update_multiplatform, 0);
    RunnerInterface_AddFunction("fmod_system_mixer_suspend", __GMLIBSTUB_GMVAL__fmod_system_mixer_suspend, 0);
    RunnerInterface_AddFunction("fmod_system_mixer_resume", __GMLIBSTUB_GMVAL__fmod_system_mixer_resume, 0);
    RunnerInterface_AddFunction("fmod_system_set_output", __GMLIBSTUB_GMVAL__fmod_system_set_output, 1);
    RunnerInterface_AddFunction("fmod_system_get_output", __GMLIBSTUB_GMVAL__fmod_system_get_output, 0);
    RunnerInterface_AddFunction("fmod_system_get_num_drivers", __GMLIBSTUB_GMVAL__fmod_system_get_num_drivers, 0);
    RunnerInterface_AddFunction("fmod_system_get_driver_info_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_driver_info_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_system_set_driver", __GMLIBSTUB_GMVAL__fmod_system_set_driver, 1);
    RunnerInterface_AddFunction("fmod_system_get_driver", __GMLIBSTUB_GMVAL__fmod_system_get_driver, 0);
    RunnerInterface_AddFunction("fmod_system_set_software_channels", __GMLIBSTUB_GMVAL__fmod_system_set_software_channels, 1);
    RunnerInterface_AddFunction("fmod_system_get_software_channels", __GMLIBSTUB_GMVAL__fmod_system_get_software_channels, 0);
    RunnerInterface_AddFunction("fmod_system_set_software_format", __GMLIBSTUB_GMVAL__fmod_system_set_software_format, 3);
    RunnerInterface_AddFunction("fmod_system_get_software_format_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_software_format_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_set_dsp_buffer_size", __GMLIBSTUB_GMVAL__fmod_system_set_dsp_buffer_size, 2);
    RunnerInterface_AddFunction("fmod_system_get_dsp_buffer_size_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_dsp_buffer_size_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_set_stream_buffer_size", __GMLIBSTUB_GMVAL__fmod_system_set_stream_buffer_size, 2);
    RunnerInterface_AddFunction("fmod_system_get_stream_buffer_size_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_stream_buffer_size_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_set_advanced_settings_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_set_advanced_settings_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_get_advanced_settings_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_advanced_settings_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_set_speaker_position", __GMLIBSTUB_GMVAL__fmod_system_set_speaker_position, 4);
    RunnerInterface_AddFunction("fmod_system_get_speaker_position_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_speaker_position_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_system_set_3d_settings", __GMLIBSTUB_GMVAL__fmod_system_set_3d_settings, 3);
    RunnerInterface_AddFunction("fmod_system_get_3d_settings_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_3d_settings_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_set_3d_num_listeners", __GMLIBSTUB_GMVAL__fmod_system_set_3d_num_listeners, 1);
    RunnerInterface_AddFunction("fmod_system_get_3d_num_listeners", __GMLIBSTUB_GMVAL__fmod_system_get_3d_num_listeners, 0);
    RunnerInterface_AddFunction("fmod_system_set_3d_rolloff_callback", __GMLIBSTUB_GMVAL__fmod_system_set_3d_rolloff_callback, 0);
    RunnerInterface_AddFunction("fmod_system_set_network_proxy", __GMLIBSTUB_GMVAL__fmod_system_set_network_proxy, 1);
    RunnerInterface_AddFunction("fmod_system_get_network_proxy", __GMLIBSTUB_GMVAL__fmod_system_get_network_proxy, 0);
    RunnerInterface_AddFunction("fmod_system_set_network_timeout", __GMLIBSTUB_GMVAL__fmod_system_set_network_timeout, 1);
    RunnerInterface_AddFunction("fmod_system_get_network_timeout", __GMLIBSTUB_GMVAL__fmod_system_get_network_timeout, 0);
    RunnerInterface_AddFunction("fmod_system_get_version", __GMLIBSTUB_GMVAL__fmod_system_get_version, 0);
    RunnerInterface_AddFunction("fmod_system_get_channels_playing_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_channels_playing_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_get_cpu_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_cpu_usage_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_get_file_usage_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_file_usage_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_get_default_mix_matrix_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_default_mix_matrix_multiplatform, 4);
    RunnerInterface_AddFunction("fmod_system_get_speaker_mode_channels", __GMLIBSTUB_GMVAL__fmod_system_get_speaker_mode_channels, 1);
    RunnerInterface_AddFunction("fmod_system_create_sound_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_create_sound_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_system_create_stream_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_create_stream_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_system_create_dsp", __GMLIBSTUB_GMVAL__fmod_system_create_dsp, 0);
    RunnerInterface_AddFunction("fmod_system_create_dsp_by_type", __GMLIBSTUB_GMVAL__fmod_system_create_dsp_by_type, 1);
    RunnerInterface_AddFunction("fmod_system_create_channel_group", __GMLIBSTUB_GMVAL__fmod_system_create_channel_group, 1);
    RunnerInterface_AddFunction("fmod_system_create_sound_group", __GMLIBSTUB_GMVAL__fmod_system_create_sound_group, 1);
    RunnerInterface_AddFunction("fmod_system_create_reverb_3d", __GMLIBSTUB_GMVAL__fmod_system_create_reverb_3d, 0);
    RunnerInterface_AddFunction("fmod_system_play_sound_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_play_sound_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_system_play_dsp_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_play_dsp_multiplatform, 3);
    RunnerInterface_AddFunction("fmod_system_get_channel", __GMLIBSTUB_GMVAL__fmod_system_get_channel, 1);
    RunnerInterface_AddFunction("fmod_system_get_master_channel_group", __GMLIBSTUB_GMVAL__fmod_system_get_master_channel_group, 0);
    RunnerInterface_AddFunction("fmod_system_get_master_sound_group", __GMLIBSTUB_GMVAL__fmod_system_get_master_sound_group, 0);
    RunnerInterface_AddFunction("fmod_system_set_3d_listener_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_set_3d_listener_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_system_get_3d_listener_attributes_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_3d_listener_attributes_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_system_set_reverb_properties_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_set_reverb_properties_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_system_get_reverb_properties_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_reverb_properties_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_system_attach_channel_group_to_port_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_attach_channel_group_to_port_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_detach_channel_group_from_port", __GMLIBSTUB_GMVAL__fmod_system_detach_channel_group_from_port, 1);
    RunnerInterface_AddFunction("fmod_system_get_record_num_drivers_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_record_num_drivers_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_get_record_driver_info_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_record_driver_info_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_system_get_record_position", __GMLIBSTUB_GMVAL__fmod_system_get_record_position, 1);
    RunnerInterface_AddFunction("fmod_system_record_start", __GMLIBSTUB_GMVAL__fmod_system_record_start, 3);
    RunnerInterface_AddFunction("fmod_system_record_stop", __GMLIBSTUB_GMVAL__fmod_system_record_stop, 1);
    RunnerInterface_AddFunction("fmod_system_is_recording", __GMLIBSTUB_GMVAL__fmod_system_is_recording, 1);
    RunnerInterface_AddFunction("fmod_system_create_geometry", __GMLIBSTUB_GMVAL__fmod_system_create_geometry, 2);
    RunnerInterface_AddFunction("fmod_system_set_geometry_settings", __GMLIBSTUB_GMVAL__fmod_system_set_geometry_settings, 1);
    RunnerInterface_AddFunction("fmod_system_get_geometry_settings", __GMLIBSTUB_GMVAL__fmod_system_get_geometry_settings, 0);
    RunnerInterface_AddFunction("fmod_system_load_geometry_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_load_geometry_multiplatform, 2);
    RunnerInterface_AddFunction("fmod_system_get_geometry_occlusion_multiplatform", __GMLIBSTUB_GMVAL__fmod_system_get_geometry_occlusion_multiplatform, 1);
    RunnerInterface_AddFunction("fmod_system_lock_dsp", __GMLIBSTUB_GMVAL__fmod_system_lock_dsp, 0);
    RunnerInterface_AddFunction("fmod_system_unlock_dsp", __GMLIBSTUB_GMVAL__fmod_system_unlock_dsp, 0);
    RunnerInterface_AddFunction("fmod_system_set_callback", __GMLIBSTUB_GMVAL__fmod_system_set_callback, 1);
    RunnerInterface_AddFunction("fmod_system_set_user_data", __GMLIBSTUB_GMVAL__fmod_system_set_user_data, 2);
    RunnerInterface_AddFunction("fmod_system_get_user_data", __GMLIBSTUB_GMVAL__fmod_system_get_user_data, 1);
    RunnerInterface_AddFunction("fmod_fetch_callbacks", __GMLIBSTUB_GMVAL__fmod_fetch_callbacks, 2);
    RunnerInterface_AddFunction("fmod_last_result", __GMLIBSTUB_GMVAL__fmod_last_result, 0);
}
