.PHONY: all coverage style test

all: test

benchmark:
	go test -benchmem -bench=.

ci:
	go install github.com/jstemmer/go-junit-report/v2@latest
	go test -timeout 2m -v ./... 2>&1 | go-junit-report -set-exit-code -iocopy -out ${SHORT_SHA}_test_log.xml

coverage:
	go test -v -cover -coverprofile=coverage.out

style:
	go vet

test: style
	go test -v -cover
