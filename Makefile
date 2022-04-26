STACK=mongo

db-up:
	docker stack deploy --with-registry-auth -c docker-compose.yml ${STACK}