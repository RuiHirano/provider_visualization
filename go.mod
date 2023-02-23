module github.com/synerex/synerex_alpha/provider/visualization-provider

require (
	github.com/google/logger v1.0.1 // indirect
	github.com/google/uuid v1.3.0
	github.com/mtfelian/golang-socketio v1.5.2
	github.com/synerex/synerex_alpha/api v0.0.0
	github.com/synerex/synerex_alpha/nodeapi v0.0.0-20190904050037-afd3805ee7cc
	github.com/synerex/synerex_alpha/provider/simutil v0.0.0-00010101000000-000000000000
	github.com/synerex/synerex_alpha/util v0.0.0-00010101000000-000000000000
	golang.org/x/text v0.3.8 // indirect
	google.golang.org/genproto v0.0.0-20200207204624-4f3edf09f4f6 // indirect
	google.golang.org/grpc v1.28.0
)

replace (
	github.com/synerex/synerex_alpha/api => ./../../api
	github.com/synerex/synerex_alpha/nodeapi => ./../../nodeapi
	github.com/synerex/synerex_alpha/provider/simutil => ../simutil
	github.com/synerex/synerex_alpha/util => ../../util
)

go 1.13
