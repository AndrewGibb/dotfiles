#!/usr/bin/env julia

mypackages = [
"ArgParse",
"BinDeps",
"Cairo",
"Colors",
"ColorTypes",
"ColorVectorSpace",
"Gadfly",
"Conda",
"DataFrames",
"Debug",
"Distributions",
"Docile",
"FixedPointNumbers",
"FixedSizeArrays",
"GeometryTypes",
"Grid",
"HDF5",
"IJulia",
"ImageMagick",
"Images",
"ImageView",
"Iterators",
"JLD",
"JSON",
"Lexicon",
"LightXML",
"Lumberjack",
"PyPlot",
"Requests",
"SIUnits",
"Vega",
"Winston"
]

# Internal packages
ipackages = [
"https://github.com/bbc/ARRIRAW.jl.git",
"https://github.com/bbc/EXRImages.jl.git",
"https://github.com/bbc/V210Images.jl.git",
"https://github.com/bbc/TurntableMotionBlur.jl.git"
]

Pkg.update()

for p in mypackages
  Pkg.add(p)
end

for p in ipackages
  Pkg.clone(p)
end
