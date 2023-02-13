# papi
Simple Python API Implementation, or "Python API"

# Description
This is to make making python webservers for apis easy and quick. The objective is to enable
rapid development with little overhead.

# Installation
```bash
cd /usr/src
git clone https://github.com/eb3095/papi.git
cd papi/papi
python3 setup.py install
```

# Usage example
```python
import json

from papi import API, APIHandler, Endpoint

API_OBJ = None
FAILURE_TEMPLATE = {
    "error": {"code": 400, "message": "Invalid input"},
    "status": "fail",
}
RESPONSE_TEMPLATE = {"data": {"response": ""}, "status": "success"}


class AIAPI(API):
    def __init__(self, config):
        super().__init__(config, "/v1", AIAPIHandler)


class AIAPIHandler(APIHandler):
    def init(self):
        GenericEndpoint(self)


class GenericEndpoint(Endpoint):
    def __init__(self, handler):
        super().__init__(handler)
        self.path = "/generic/endpoint"
        self.required_fields = ["input", "another_value"]

    def POST(self, data):
        inp = data["input"]
        # Do something
        result = "Hello!"
        return result, 200


def main():
    global API_OBJ
    with open("/etc/project/config.json") as f:
        config = json.load(f)
    API_OBJ = AIAPI(config)
    API_OBJ.start()


if __name__ == "__main__":
    main()
```

The config is simple, and as you can see designed to work well with configs of the entire project.

```json
{
    "openai": {
        "openai_key": "snip",
        "tokens": 1024,
        "temperature": 0.7,
        "n": 1
    },
    "webserver": {
        "api_key": "snip",
        "host": "127.0.0.1",
        "port": 5000
    }
}
```