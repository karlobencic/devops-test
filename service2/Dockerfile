FROM python:alpine3.16

WORKDIR /app

RUN apk --no-cache add curl \
    && curl -sL https://github.com/openfaas/faas/releases/download/0.9.14/fwatchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog

ENV fprocess="python entrypoint.py"
COPY entrypoint.py .
COPY requirements.txt .

RUN pip install with --no-cache-dir -r requirements.txt

EXPOSE 8080
CMD [ "fwatchdog" ]