build:
	docker build -t workspace .
run:
	docker run --rm -it --name workspace --hostname workspace workspace
background:
	docker run -d --name workspace workspace
