build:
	shards build

run:
	ag -l | PORT=3002 entr -r crystal run app.cr

console:
	docker run -it --rm -v ${PWD}:/app -w /app crystallang/crystal:0.29.0 bash

pack:
	docker build -t silasb/kubernetes-patterns-pdf .

upload:
	docker push silasb/kubernetes-patterns-pdf

