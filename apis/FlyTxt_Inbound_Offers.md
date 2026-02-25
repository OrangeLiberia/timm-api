# FlyTxt/Inbound/Offers

This method is called to obtain the inbound offers existing on the FlyTxt platform.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Pushes an Event to DSTK platform |

## Endpoint URL

```
TIMM/v1/FlyTxt/Inbound/Offers
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/FlyTxt/Inbound/Offers` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/FlyTxt/Inbound/Offers` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. Example with Body: curl.exe --location --request POST http://192.168.19.12:12000/INT/v1/Flytxt/Inbound/Offers --header 'Content-Type: application/json' --data-raw '{ "auth":{ "user":"amdocs", "pwd":"amd0csYou$er" },"param": {"msisdn":"231775471993"}}' |

## Mock Responses

### POST — Pushes an Event to DSTK platform

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "actionid": "ACT-20241107-001234"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -12,
  "exec_msg": "Authorization failed"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### POST — Pushes an Event to DSTK platform

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/FlyTxt/Inbound/Offers" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588"
  }
}'
```
