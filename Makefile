default:
	@cat makefile

env:
	python3 -m venv env; . env/bin/activate; pip install --upgrade pip; pip install -r requirements.txt;
	. env/bin/activate
	@echo "To activate the virtual environment, run: source env/bin/activate"