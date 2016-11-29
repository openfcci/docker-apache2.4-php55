all: push

build:
	docker build -t apache24-php55 .

tag: build
	docker tag apache24-php55 fccorg/apache24-php55

push: tag
	docker push fccorg/apache24-php55
