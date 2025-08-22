#Install go using webi

if ! command -v go; then 
	curl -sS https://webi.sh/golang | sh;\
	source ~/.config/envman/PATH.env
fi
#change cgo to use zig
go env -w CC="zig cc"
go env -w CXX="zig c++"

