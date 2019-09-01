.PHONE: all docker release

binary  = build/bin/linux/kube-google-iam
sources = $(shell find . -name '*.go')

all: docker

$(binary): $(sources)
	GOOS=linux GOARCH=386 go build -o $@ .

docker: $(binary)
	docker build -t convox/kube-google-iam .

release: docker
	docker push convox/kube-google-iam
