#Install go using webi

curl -sS https://webi.sh/golang | sh
source ~/.config/envman/PATH.env

#change cgo to use zig
go env -w CC="zig cc"
go env -w CXX="zig c++"

