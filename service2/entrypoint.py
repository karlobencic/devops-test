import requests
import sys
import os

service1_host = os.getenv('SERVICE1_HOST')
service1_port = os.getenv('SERVICE1_PORT')
SERVICE1_URL = f"http://{service1_host}:{service1_port}"

message = requests.get(sys.stdin.readline()).text
data = ["md5", message]

print(requests.post(SERVICE1_URL, data="\n".join(data)))