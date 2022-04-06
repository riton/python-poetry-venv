test-with-poetry-install:
	docker run --init --entrypoint /src/tools/install-using-poetry.sh --rm -v $(shell pwd):/src:ro -w /src -it python:3.8

test-with-pip-install:
	docker run --init --entrypoint /src/tools/install-using-pip.sh --rm -v $(shell pwd):/src:ro -w /src -it python:3.8
