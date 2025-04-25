#!/bin/sh

NC='\033[0m';

output_green() {
    green='\033[0;32m';
    echo "${green}${1}${NC}"
}

output_red() {
    red='\033[0;31m';
    echo "${red}${1}${NC}";
}

# Runs LTLs
# First argument - path to a Promela file
# Other arguments - list of LTLs
ltl() {
    echo "Processing file ${1}";
    exit_status=0;

    for ltl in ${@:2}; do
        echo "\n> Running LTL ${ltl}";
        output=$(spin -search -a -ltl "${ltl}" "${1}" | grep 'errors:');

        bytes=$(echo "${output}" | cut -d ' ' -f 2);
        depth=$(echo "${output}" | cut -d ' ' -f 6 | cut -d ',' -f 1);
        errors=$(echo "${output}" | cut -d ' ' -f 8);

        if [ -z "${errors}" ]; then
            output_red "Failed to parse provided output";
            return 1;
        fi

        if [ "${errors}" -eq "0" ]; then
            output_green "> LTL ${ltl} is correct: failed to find a counter example; state-vector bytes: ${bytes}, depth: ${depth}, errors: ${errors}";
        else
            output_red "> LTL ${ltl} is incorrect: found a counter example; state-vector bytes: ${bytes}, depth: ${depth}, errors: ${errors}";
            exit_status=1;
        fi
    done

    rm -r *.trail pan 2> /dev/null || true

    return ${exit_status};
}
