# CRM/Subscriber/Language

This method can be called to set the subscriber language. It will only return a successful code if subscriber exists and a valid language is specified.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Adds or Sets the Subscriber language |

## Endpoint URL

```
TIMM/v1/CRM/Subscriber/Language
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/Language` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `msisdn` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: `077xxxxxx` Or `23177xxxxxxx`. Or, if pseudonymization is enabled for the connection, encrypted `X-MSISDN` header can be passed in directly. |
| `LanguageCode` | `String` | ⬜ Optional | Language code. See API `/TIMM/v1/CRM/Types/Language` for reference |
| `LanguageID` | `String` | ⬜ Optional | Language ID. See API `/TIMM/v1/CRM/Types/Language` for reference |

> Either `LanguageCode` or `LanguageID` must be provided.

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |

## Responses

### POST — Adds or Sets the Subscriber language

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success"
}
```

**Error Response — Missing MSISDN:**
```json
{
  "exec_code": -1003,
  "exec_msg": "API Call is missing a parameter: MSISDN"
}
```

**Error Response — Invalid Language Specification:**
```json
{
  "exec_code": -100,
  "exec_msg": "Invalid Language Specification"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
| `-100` | Invalid Language Specification |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-2000` | General Error / Execution Error |

## cURL Examples

### POST — Missing MSISDN

```bash
curl -k -X POST \
  "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  }
}'
```

### POST — Invalid Language Specification

```bash
curl -k -X POST \
  "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language" \
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

### POST — Set Language by LanguageCode

```bash
curl -k -X POST \
  "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "msisdn": "0778888501",
    "LanguageCode": "EN"
  }
}'
```

### POST — Set Language by LanguageID

```bash
curl -k -X POST \
  "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "msisdn": "0778888501",
    "LanguageID": "1"
  }
}'
```
