#!/bin/sh -e

show_help () {
    echo "Travis environment operation on many repository"
    echo "\trun:"
    echo "\t\t$0 <repo match pattern> list"
    echo "\t\t$0 <repo match pattern> set NAME VALUE [travis OPTIONS]"
    echo "\t\t$0 <repo match pattern> unset NAMES.. [travis OPTIONS]"
    exit 1
}

if [ "$#" -lt 2 ]; then
    show_help
fi

if [ "$1" = "--org" ]; then
    API="--org"
    shift
else
    API="--com"
fi

MATCH=$1
COMMAND=$2
shift 2

case "$COMMAND" in
    "list" )
        if [ "$#" -gt 0 ]; then show_help; fi ;;
    "set" )
        if [ "$#" -lt 2 ]; then show_help; fi ;;
    "unset" )
        if [ "$#" -lt 1 ]; then show_help; fi ;;
    *) show_help ;;
esac

travis repos --match $MATCH --active --no-interactive $API | xargs -n 1 travis env $COMMAND $@ $API --repo
