# Subscriber/Billers/OM/Debit/Authorize

This method instigates Subscriber to get approval the consent from the auto debit

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows for a partner to view the status of it’s auto-debits |
| `POST` | Allows for a partner to get approval from the subscriber for the auto-debit |

## Endpoint URL

```
/TIMM/v1/Subscriber/Billers/OM/Debit/Authorize
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Subscriber/Billers/OM/Debit/Authorize` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/Debit/Authorize` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `EXTERNALID` | `String` | ✅ Required | External Unique ID for this authorization |
| `NAME` | `String` | ✅ Required | Name of the Debit |
| `MESSAGE` | `String` | ⬜ Optional | Message to be presented to the user URL URL to an implementation of Subscriber Payment Callback/Webhook |

## Mock Responses

### GET — Allows for a partner to view the status of it’s auto-debits

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

### POST — Allows for a partner to get approval from the subscriber for the auto-debit

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

### GET — Allows for a partner to view the status of it’s auto-debits

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/Debit/Authorize?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:EXTERNALID=ID-001234&param:NAME=John Doe&param:MESSAGE=<MESSAGE>"
```

### POST — Allows for a partner to get approval from the subscriber for the auto-debit

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/Debit/Authorize" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "EXTERNALID": "ID-001234",
    "NAME": "John Doe",
    "MESSAGE": "<MESSAGE>"
  }
}'
```
