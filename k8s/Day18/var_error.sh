#!/bin/bash
set -e 
var1="${1?:Error \$var1 not set. Bye}"
echo "Now working on $var1 ..." 
var2="${var1?:Error \$var2 not set. Bye}"
echo "Now working on $var2 ..."

echo "------------------------------------"

input="Foo bar"
echo ${input?Error \$input is not defined.}
#unset input
echo ${input?Error \$input is not defined.}