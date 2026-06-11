# Subscriber/LEC/Tokens

This method allows the Subscriber to see their previous purchased LEC tokens.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | List all the subscribers last LEC tokens. |

## Endpoint URL

```
/TIMM/v1/Subscriber/LEC/Tokens
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.210:11003/TIMM/v1/Subscriber/LEC/Tokens` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/LEC/Tokens` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to get the tokens. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |

## Response Fields

> Result type: **Array**

| Field | Type | Description |
|-------|------|-------------|
| `Amount` | `String` | Token purchase amount |
| `Currency` | `String` | Token purchase currency |
| `MSISDN` | `String` | Subscriber MSISDN |
| `MeterNumber` | `String` | Meter number associated with the token |
| `Token` | `String` | Purchased meter token |

## Responses

### GET — List all the subscribers last LEC tokens.

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": [
    {
      "Amount": "2000",
      "Currency": "LD",
      "MSISDN": "0777851990",
      "MeterNumber": "80078484054",
      "Token": "23576415084376067351"
    },
    {
      "Amount": "2000",
      "Currency": "LD",
      "MSISDN": "0777851990",
      "MeterNumber": "80078484054",
      "Token": "05530393839890761157"
    }
  ]
}
```

**Error Response:**
```json
{
  "exec_code": -200,
  "exec_msg": "No Tokens found"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
| `-200` | No Tokens found |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### GET — No Tokens found

```bash
curl -k -X GET \
  "https://192.168.19.210:11003/TIMM/v1/Subscriber/LEC/Tokens?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0775144471"
```

### GET — List all the subscribers last LEC tokens.

```bash
curl -k -X GET \
  "https://192.168.19.210:11003/TIMM/v1/Subscriber/LEC/Tokens?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777851990"
```
