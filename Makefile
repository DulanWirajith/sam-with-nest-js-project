.PHONY: build-RuntimeDependenciesLayer build-lambda-common
.PHONY: build-ExampleFunction

build-ExampleFunction:
	$(MAKE) HANDLER=src/main.ts build-lambda-common

build-lambda-common:
	npm install
	rm -rf dist
	nest build
	cp -r dist "$(ARTIFACTS_DIR)/"

build-RuntimeDependenciesLayer:
	mkdir -p "$(ARTIFACTS_DIR)/nodejs"
	cp package.json yarn.lock "$(ARTIFACTS_DIR)/nodejs/"
	npm install --production --prefix "$(ARTIFACTS_DIR)/nodejs/"
	rm "$(ARTIFACTS_DIR)/nodejs/package.json"