#!/bin/bash

rev_it(){
        echo "$1" | rev
}

main(){
        reversed=$(rev_it "$1")
        echo "$reversed"
}

main "$@"