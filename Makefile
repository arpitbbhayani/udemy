init:
	python3 -m venv venv
	venv/bin/pip install -r requirements.txt

lint:
	autopep8 --in-place --aggressive --recursive udemy
	pylint udemy

clean:
	find udemy -name "*.pyc" -exec rm -f {} \;
	find udemy -name "*.pyo" -exec rm -f {} \;
	find udemy -name "__pycache__" -exec rm -f {} \;

start:
	python main.py
