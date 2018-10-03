# Pre-canned Mock
_Pre-canned mock_ utilises the mocking functionality of 
[`node-easymock`](https://github.com/CyberAgent/node-easymock/blob/master/README.md) to provide a set of `pre-canned` responses.

**_DISCLAIMER:_**
_This is just a prototype intended for simple demonstrations / testing / debugging. This is not intended for production use._

### Running
```
docker-compose up mock
```
## Responses
### Home page
Default home page is available at: [`http://localhost:3000`](`http://localhost:3000`)

### Status Code
Fetch response with desired status code at: `http://localhost:3000/api/status/<status_code>`
Eg.
```
curl -sSi http://localhost:3000/api/status/200  # returns http status code 200
curl -sSi http://localhost:3000/api/status/400  # returns http status code 400
curl -sSi http://localhost:3000/api/status/500  # returns http status code 500
```

### Errors
Get list of available error responses at: `http://localhost:3000/api/errors`
```
curl -sS http://localhost:3000/api/errors
```

### Resources
Get list of resources at: `http://localhost:3000/api/resources`
```
curl -sS http://localhost:3000/api/resources
```

Fetch specific resource at: `http://localhost:3000/api/status/resources/<resource_id>`
Eg.
```
curl -sS http://localhost:3000/api/resources/999
```

### Simulated Lag
Get list of available response lags at: `http://localhost:3000/api/lags`
```
curl -sS http://localhost:3000/api/lags
```

Fetch response with desired lag at: `http://localhost:3000/api/lags/<lag_in_ms>`
Eg.
```
curl -s -w "%{time_total}\n" -o /dev/null http://localhost:3000/api/lags/5000  # Take 5 seconds
```

## Customising
Change `pre-canned` functionality by voluming in different files to override existing ones.
[Available functionality for `node-easymock`](https://github.com/CyberAgent/node-easymock/blob/master/README.md)
- *configuration*: `app/config.json`
- Home Page *html*: `app/index.html`
- Home Page *styles*: `app/css/index.css`
- Home Page *image*: `app/img/index.jpg`

### Random Errors
Override `app/config.json` with different values for the error `rate`.
Eg.

```
  "error-rate": 0,
  "errors" : [
    {
      "name": "401-error",
      "rate": 0.2
    },{
      "name": "403-error",
      "rate": 0.4
    }
  ]
```
Randomly returns `401-error` and `403-error` error responses at their configured rate.

