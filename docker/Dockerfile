FROM python:3.9

WORKDIR /pythondocker

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

ENTRYPOINT python main.py
