#! /usr/bin/env sh
echo "Building CGRateS static..."

GIT_LAST_LOG=$(git log -1 | tr -d "'")

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -ldflags "-X 'github.com/cgrates/cgrates/utils.GitLastLog=$GIT_LAST_LOG'" -o $GOPATH/bin/static/cgr-engine github.com/cgrates/cgrates/cmd/cgr-engine
cr=$?
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -ldflags "-X 'github.com/cgrates/cgrates/utils.GitLastLog=$GIT_LAST_LOG'" -o $GOPATH/bin/static/cgr-loader github.com/cgrates/cgrates/cmd/cgr-loader
cl=$?
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -ldflags "-X 'github.com/cgrates/cgrates/utils.GitLastLog=$GIT_LAST_LOG'" -o $GOPATH/bin/static/cgr-console github.com/cgrates/cgrates/cmd/cgr-console
cc=$?
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -ldflags "-X 'github.com/cgrates/cgrates/utils.GitLastLog=$GIT_LAST_LOG'" -o $GOPATH/bin/static/cgr-migrator github.com/cgrates/cgrates/cmd/cgr-migrator
cm=$?
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -ldflags "-X 'github.com/cgrates/cgrates/utils.GitLastLog=$GIT_LAST_LOG'" -o $GOPATH/bin/static/cgr-tester github.com/cgrates/cgrates/cmd/cgr-tester
ct=$?

exit $cr || $cl || $cc || $cm || $ct
