help([[
This module loads libraries for building the CCPP Single-Column Model on
the CISL machine Derecho (Cray) using Intel-classic-2023.0.0
]])

whatis([===[Loads libraries needed for building the CCPP SCM on Derecho ]===])

load(pathJoin("cmake", os.getenv("cmake_ver") or "3.26.3"))
load(pathJoin("ncarenv", os.getenv("ncarenv_ver") or "23.06"))
load(pathJoin("craype", os.getenv("craype_ver") or "2.7.20"))

unload("netcdf")
unload("hdf5")
load(pathJoin("intel-classic", os.getenv("intel_classic_ver") or "2023.0.0"))
load(pathJoin("cray-mpich", os.getenv("cray_mpich_ver") or "8.1.25"))

prepend_path("MODULEPATH","/glade/work/epicufsrt/contrib/derecho/hpc-stack/intel-classic-2023.0.0/modulefiles/stack")
load(pathJoin("hpc", os.getenv("hpc_ver") or "1.2.0"))
load(pathJoin("hpc-intel-classic", os.getenv("hpc_intel_classic_ver") or "2023.0.0"))
load(pathJoin("hpc-cray-mpich", os.getenv("hpc_cray_mpich_ver") or "8.1.25"))

load(pathJoin("ncarcompilers", os.getenv("ncarcompilers_ver") or "1.0.0"))

load_any("netcdf/4.9.2","netcdf-c/4.9.2")
load_any("netcdf/4.9.2","netcdf-fortran/4.6.0")

load("bacio/2.4.1")
load("sp/2.3.3")
load("w3emc/2.9.2")

setenv("CC","cc")
setenv("FC","ftn")
setenv("CXX","CC")

setenv("CMAKE_C_COMPILER","cc")
setenv("CMAKE_CXX_COMPILER","CC")
setenv("CMAKE_Fortran_COMPILER","ftn")
setenv("CMAKE_Platform","derecho.intel")

load("conda/latest")

if mode() == "load" then
   LmodMsgRaw([===[Please do the following to activate conda environment:
       > conda activate /glade/p/ral/jntp/GMTB/CCPP_SCM/conda/ccpp-scm
]===])
end

