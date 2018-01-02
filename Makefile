QT := 5.10.0
QTM := 5.10
TAG := qt-builder

.PHONY: image run

image: $(QTF)
	docker build --no-cache --build-arg QT=$(QT) --build-arg QTM=$(QTM) --tag $(TAG) .

run:
	docker run -it $(TAG) /bin/bash
