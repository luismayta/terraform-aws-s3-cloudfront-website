#
# See ./CONTRIBUTING.rst
#

FILE_README=$(ROOT_DIR)/README.rst
PATH_DOCKER_COMPOSE:=provision/docker-compose

docs: docs.help

docs.help:
	@echo '    Docs:'
	@echo ''
	@echo '        docs.show                  Show restview README'
	@echo ''

docs.show: clean
	grip
