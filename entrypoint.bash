#!/bin/bash

echo "start generating proto to golang"


function generate_types_golang {
    for x in $(find -name *.proto)
    do 
        echo "Start generate $x contract for golang models..."
        exec $(protoc-wrapper -I/usr/include --gogofast_out=./ -I. $x)
        if [[ $? -eq 0 ]]; then 
            echo "Completely generate $x"
        else
            echo "Generated with problems."
            echo "Stopping process..."
            exit 1
        fi
    done

}

function placingYourContractsToNeedPlace {
    echo "gen_path: $path_generated"
    cp -r $path_generated/* ./
    rm -rf $global_path
}

generate_types_golang
placingYourContractsToNeedPlace

