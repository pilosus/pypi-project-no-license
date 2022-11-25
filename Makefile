.PHONY: install
install:
	@echo "Install package and its dependencies"
	pip install -U pip setuptools wheel twine
	pip install -e .


.PHONY: build
build:
	@echo "Build Python package"
	python setup.py sdist bdist_wheel


.PHONY: push-test
push-test:
	@echo "Push package to test.pypi.org"
	python -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*


.PHONY: push
push:
	@echo "Run package to PyPI"
	python -m twine upload dist/*


.PHONY: clean
clean:
	@echo "Clean up files"
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf .cache
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf htmlcov
	rm -rf *.egg-info
	rm -f .coverage
	rm -f .coverage.*
	rm -rf build
	rm -rf dist
	python setup.py clean
