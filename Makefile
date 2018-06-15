TAG := qt-linux

.PHONY: image run

image: $(QTF)
	docker build --no-cache --tag $(TAG) .

run:
	docker run -it $(TAG) /bin/bash
