zigset=$(go env CC | head -n 1)

if [[ "$zigset" != "zig cc" ]]; then
	echo "true"
else
	echo "false"
fi
