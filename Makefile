.DEFAULT_GOAL := help

setup: ## 依存ライブラリをインストールする。
		@bundle config set path 'vendor'
		@bundle install
		@echo ">> Installed all dependencies"

clean: ## 生成したHTML/PDFを全て削除する。ファイル生成前にも実行される。
		@rm -f docs/*.pdf
		@rm -f docs/*.html
		@echo ">> Cleanup all PDF."

pdf: clean ## PDFを生成する。
		@./scripts/build-pdf.sh

html: clean ## HTMLを生成する。
		@./scripts/build-html.sh

help:
		@grep -E '^[/a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | perl -pe 's%^([/a-zA-Z_-]+):.*?(##)%$$1 $$2%' | awk -F " *?## *?" '{printf "\033[36m%-15s\033[0m %-50s %s\n", $$1, $$2, $$3}'
