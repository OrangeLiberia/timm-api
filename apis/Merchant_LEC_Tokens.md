# Merchant/LEC/Tokens

This method allows the subscriber to get the LEC tokens.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | List all the LEC tokens. |

## Endpoint URL

```
/TIMM/v1/Merchant/LEC/Tokens
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Merchant/LEC/Tokens` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Merchant/LEC/Tokens` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to get the tokens. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |

## Mock Responses

### GET — List all the LEC tokens.

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
| `100` | Success |
| `200` | Success With Warning |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### GET — List all the LEC tokens.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Merchant/LEC/Tokens?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
