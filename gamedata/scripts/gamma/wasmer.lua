---@class ffi
---@field cdef string
---@field load fun(path: string): wasmer
local ffi = require "ffi"

ffi.cdef [[
    void wat2wasm(wasm_byte_vec_t* wat, wasm_byte_vec_t* out);
]]

ffi.cdef [[
    typedef uint8_t wasm_byte_t;
    typedef struct wasm_byte_vec_t {
        size_t size;
        wasm_byte_t* data;
    } wasm_byte_vec_t;

    void wasm_byte_vec_new(wasm_byte_vec_t* out, size_t size, wasm_byte_t* ptr);
    void wasm_byte_vec_delete(wasm_byte_vec_t* out);
]]

ffi.cdef [[
    typedef wasm_extern_t wasm_extern_t;
    typedef struct wasm_extern_vec_t {
        size_t size;
        wasm_extern_t* data;
    } wasm_extern_vec_t;

    void wasm_extern_vec_new(wasm_extern_vec_t* out, size_t size, wasm_extern_t* ptr);
    void wasm_extern_vec_delete(wasm_extern_vec_t* out);
]]

ffi.cdef [[

]]

ffi.cdef [[
    typedef struct wasm_engine_t wasm_engine_t;

    wasm_engine_t* wasm_engine_new();
    void           wasm_engine_delete(wasm_engine_t* engine);
]]

ffi.cdef [[
    typedef struct wasm_store_t wasm_store_t;

    wasm_store_t*  wasm_store_new(wasm_engine_t* engine);
    void           wasm_store_delete(wasm_store_t* store);
]]

ffi.cdef [[
    typedef struct wasm_module_t wasm_module_t;

    wasm_module_t* wasm_module_new(wasm_store_t* store, wasm_byte_vec_t* bytes);
    void           wasm_module_delete(wasm_module_t* module);
]]

ffi.cdef [[
    typedef struct wasm_instance_t wasm_instance_t;

    wasm_instance_t* wasm_instance_new(wasm_store_t* store, wasm_module_t* module, wasm_extern_vec_t* imports, wasm_trap_t* trap);
    void             wasm_instance_delete(wasm_instance_t* instance);
]]

---@class wasmer
---
---@field wasm_byte_vec_new fun(out: userdata, size: number, ptr: userdata)
---@field wasm_byte_vec_delete fun(out: userdata)
---
---@field wasm_engine_new fun(): userdata
---@field wasm_engine_delete fun(engine: userdata)
---
---@field wasm_store_new fun(engine: userdata): userdata
---@field wasm_store_delete fun(store: userdata)
---
---@field wasm_module_new fun(store: userdata, bytes: userdata)
---@field wasm_module_delete fun(module: userdata)
---
---@field wasm_instance_new fun()
---@field wasm_instance_delete fun(instance: userdata)
local wasmer = ffi.load("bin/wasmer.dll")
return wasmer
