# External/Redirect

This method will blindly redirect the caller. This API only provides the standard features: authentication, logging, and rate throttling. After authenticated, the connection is redirected to the RAW destination URL, where the HTTP Verb, HTTP URL parameters the HTTP Headers and HTTP Body are fully forwarded to the API configured RAW URL.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows the redirect to an internal API specified by the redirect object |
| `GET` | Allows the redirect to an internal API specified by the redirect object |
| `DELETE` | Allows the redirect to an internal API specified by the redirect object |
| `PUT` | Allows the redirect to an internal API specified by the redirect object |

## Endpoint URL

```
parameters
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/parameters` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/parameters` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `auth:user` | `String` | ✅ Required | API Username |
| `auth:Pwd` | `String` | ✅ Required | API Password Due to the constraints of the implemented functionality of this API, authentication available is only available through the URL and/or HTTP Basic. (to clarify, authentication through HTTP Body is not supported) Example of a Redirect request to a DSTK URL: curl.exe --header 'Content-Type: application/xml' --location --data-raw '<request> <request-name>SendUnitaryRequest</request-name> <params> <password>pwd</password> <username>user</username> <scenario-name>MyScenario</scenario-name> <msisdn>231777777777</msisdn> <transaction-id>1234567</transaction-id> <smsc-channel-driver-id>99</smsc-channel-driver-id> <external-transaction-id>12123456</external-transaction-id> <service-validity-period>7200</service-validity-period> <is-notification-required>false</is-notification-required> <api-version>4.0</api-version> </params> </request>' --request POST http://[IP]/External/Redirect/INT/v1/DSTK/Subscriber/PushEx?auth:user=user&auth:pwd=pwd Webhook & Callback Endpoints SMS Subscriber Webhook This notification will call an API to use this URL to redirect a call to an internal API. Action definition: Verb POST method will be used No JSON objects are provided URL [Partner Provided URL] MSISDN MSISDN CLI Short code that is causing the notification to be initiated Message Message associated with Notification (SMS or USSD Menu Selected) Channel Source of the Notification: SMS, USSD |

## Mock Responses

### POST — Allows the redirect to an internal API specified by the redirect object

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

### GET — Allows the redirect to an internal API specified by the redirect object

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

### DELETE — Allows the redirect to an internal API specified by the redirect object

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

### PUT — Allows the redirect to an internal API specified by the redirect object

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

### POST — Allows the redirect to an internal API specified by the redirect object

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/parameters" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "auth:user": "<auth:user>",
    "auth:Pwd": "<auth:Pwd>"
  }
}'
```

### GET — Allows the redirect to an internal API specified by the redirect object

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/parameters?auth:user=api_user&auth:pwd=api_password&param:auth:user=<auth:user>&param:auth:Pwd=<auth:Pwd>"
```

### DELETE — Allows the redirect to an internal API specified by the redirect object

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/parameters?auth:user=api_user&auth:pwd=api_password&param:auth:user=<auth:user>&param:auth:Pwd=<auth:Pwd>"
```

### PUT — Allows the redirect to an internal API specified by the redirect object

```bash
curl -k -X PUT \
  "https://APIDEV.Orange.com.lr/parameters" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "auth:user": "<auth:user>",
    "auth:Pwd": "<auth:Pwd>"
  }
}'
```
