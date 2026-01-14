#Install go using webi

if ! command -v go; then 
    curl -sS https://webi.sh/golang | sh
    source ~/.config/envman/PATH.env

	#change cgo to use zig
    go env -w CC="zig cc"
    go env -w CXX="zig c++"
fi


#making sure go c compilers are set to zig

zigcompilerc=$(go env CC | head -n 1)
zigcompilercpp=$(go env CXX | head -n 1)

if [[ "$zigcompilerc" != "zig cc" ]]; then

    go env -w CC="zig cc"
else
    echo "C already set"
fi

if [[ "$zigcompilercpp" != "zig c++" ]]; then

    go env -w CXX="zig c++"
else 
    echo "C++ already set"
fi

