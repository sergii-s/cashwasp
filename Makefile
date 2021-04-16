build-and-run:
	docker build -f cashwasp-api/Dockerfile -t cashwasp-api cashwasp-api
	docker run --rm -p 3000:8080 cashwasp-api