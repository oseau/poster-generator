NAME := poster-generator
CURRENTDIR=$(shell pwd)
REMOTE="tencent:/home/yk/repos/poster-generator"

.PHONY: rsync
rsync: ## rsync to tencent
	@$(MAKE) log.info MSG="starting rsync"
	@rsync -azvhP --exclude='.git/' $(CURRENTDIR)/dist $(REMOTE)
	@rsync -azvhP --exclude='.git/' $(CURRENTDIR)/Makefile $(REMOTE)
	@rsync -azvhP --exclude='.git/' $(CURRENTDIR)/docker-compose.yml $(REMOTE)
	@rsync -azvhP --exclude='.git/' $(CURRENTDIR)/nginx.conf $(REMOTE)

.PHONY: restart
restart: ## restart docker
	@$(MAKE) log.info MSG="restarting"
	@docker-compose restart


# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

# https://github.com/zephinzer/godev/blob/62012ce006df8a3131ee93a74bcec2066405fb60/Makefile#L220
## blue logs
log.debug:
	-@printf -- "\033[0;36m_ [DEBUG] ${MSG}\033[0m\n"

## green logs
log.info:
	-@printf -- "\033[0;32m> [INFO] ${MSG}\033[0m\n"

## yellow logs
log.warn:
	-@printf -- "\033[0;33m? [WARN] ${MSG}\033[0m\n"

## red logs (die mf)
log.error:
	-@printf -- "\033[0;31m! [ERROR] ${MSG}\033[0m\n"
