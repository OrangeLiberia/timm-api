# CRM/PBX/Call/Answer

This method can be called to answer a PBX call for a subscriber. It will only return a successful code if the subscriber and IP are provided.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Answers the PBX call |

## Endpoint URL

```
TIMM/v1/CRM/PBX/Call/Answer
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `http://192.168.19.139:11000/TIMM/v1/CRM/PBX/Call/Answer` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/PBX/Call/Answer` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `msisdn` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: `077xxxxxx` Or `23177xxxxxxx`. Or, if pseudonymization is enabled for the connection, encrypted `X-MSISDN` header can be passed in directly. |
| `IP` | `String` | ✅ Required | IP address of the PBX endpoint |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |

## Responses

### POST — Answers the PBX call

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success"
}
```

**Error Response — Missing IP:**
```json
{
  "exec_code": -1003,
  "exec_msg": "API Call is missing a parameter: IP"
}
```

**Error Response — Missing IP and MSISDN:**
```json
{
  "exec_code": -1003,
  "exec_msg": "API Call is missing a parameter: IP, MSISDN"
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

### POST — Missing IP

```bash
curl -k -X POST \
  "http://192.168.19.139:11000/TIMM/v1/CRM/PBX/Call/Answer" \
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

### POST — Missing IP and MSISDN

```bash
curl -k -X POST \
  "http://192.168.19.139:11000/TIMM/v1/CRM/PBX/Call/Answer" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  }
}'
```

### POST — Answer PBX Call

```bash
curl -k -X POST \
  "http://192.168.19.139:11000/TIMM/v1/CRM/PBX/Call/Answer" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "msisdn": "0778888501",
    "IP": "192.168.15.47"
  }
}'
```
