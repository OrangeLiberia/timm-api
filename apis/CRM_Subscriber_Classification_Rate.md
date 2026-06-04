# CRM/Subscriber/Classification/Rate

This method can be called to get the subscriber classification rate. It will only return a successful code if subscriber exists.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the subscriber classification rate |

## Endpoint URL

```
TIMM/v1/CRM/Subscriber/Classification/Rate
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Classification/Rate` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/Classification/Rate` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `msisdn` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: `077xxxxxx` Or `23177xxxxxxx`. Or, if pseudonymization is enabled for the connection, encrypted `X-MSISDN` header can be passed in directly. |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing subscriber classification rate |
| `resultset.Language` | `String` | Subscriber language |
| `resultset.LanguageCode` | `String` | Language code |
| `resultset.LanguageID` | `String` | Language ID |
| `resultset.code` | `String` | Classification rate code |
| `resultset.description` | `String` | Classification rate description |

## Responses

### GET — Returns the subscriber classification rate

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "Language": "Portuguese",
    "LanguageCode": "PT",
    "LanguageID": "1",
    "code": "222",
    "description": "Biz-Platinum"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -1004,
  "exec_msg": "Execution failed"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-2000` | General Error / Execution Error |

## cURL Examples

### GET — Returns the subscriber classification rate

```bash
curl -k -X GET \
  "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Classification/Rate" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "msisdn": "0778888501"
  }
}'
```
