workflow test_location {
    call find_tools
}

task find_tools {
    command {
        ls $BEDTOOLS_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $MOSDEPTH_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $PYTHON_ROOT
        echo "@@@@@@@@@@@@@@@@"

        echo $PATH
        echo "################"
        echo $MANPATH
        echo "################"
        echo $LD_LIBRARY_PATH
        echo "################"
        echo $PKG_CONFIG_PATH
        echo "################"
        echo $PYTHONPATH
        echo "################"
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/callability@sha256:efd5e8c9b50b5717eb30050321312220b32d84c0e79f365d25cfc059593f95ae"
        modules: "mosdepth/0.2.9 bedtools/2.27 python/3.7"
    }
}
