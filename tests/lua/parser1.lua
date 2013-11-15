local env  = environment()
local opts = options()
env:add_var("T", Type())
local T = Const("T")
env:add_var("x", T)
env:add_var("y", T)
env:add_var("f", mk_arrow(T, mk_arrow(T, T)))
print(parse_lean("f x (f x y)", env, opts))
-- parse_lean will use the elaborator to fill missing information
local F = parse_lean("fun x, f x x", env, opts)
print(F)
print(env:check_type(F))
