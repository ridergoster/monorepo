include ./node_modules/@wgf/tools/make/default.mk
include $(TOOLS_PATH)/make/commitlint.mk
include $(TOOLS_PATH)/make/test.mk

.PHONY: test
test: ## Test application
	@make test-cs
	@make test-coverage

storybook: ##@test Start storybook
	@BABEL_ENV=storybook $(NODE_MODULES_BIN)/start-storybook -s ./src -p 9001 -c .storybook

test-cs: ##@test Run eslint for JS and CSS (styled-components)
	@echo "${YELLOW}> Testing javascript code style...${RESET}"
	@$(NODE_MODULES_BIN)/eslint ./packages --ext .js,.jsx --cache --ignore-pattern lib --ignore-pattern node_modules
	@echo "${GREEN}✓ Great! Your code is soo stylish${RESET}"
	@echo "${YELLOW}> Testing CSS code style...${RESET}"
	@$(NODE_MODULES_BIN)/stylelint "packages/**/*.js" --formatter verbose
	@echo "${GREEN}✓ Great! Your stylesheets too!${RESET}"

test-unit: ##@test Launch test (unit and spec)
	@NODE_ENV=test CHAI_JEST_SNAPSHOT_UPDATE_ALL=true make test-js-unit

test-coverage: ##@test start jest test with coverage
	@$(NODE_MODULES_BIN)/jest --coverage

test-js-spec: ##@test start jest test
	@$(NODE_MODULES_BIN)/jest

bootstrap: ##@build bootstrap dependencies in packages
	@$(NODE_MODULES_BIN)/lerna bootstrap --use-workspaces

build-packages: ##@build build all packages in lib
	@$(NODE_MODULES_BIN)/lerna exec --parallel -- babel --root-mode upward src -d lib --ignore **/*.story.js,**/*.spec.js
