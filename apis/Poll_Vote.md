# Poll/Vote

This method is called to vote on a current Polls/Answer or to get the previous casted vote

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Casts a vote for a specific Answer of a Poll |

## Endpoint URL

```
TIMM/v1/Poll/Vote
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Poll/Vote` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Poll/Vote` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `AnswerID` | `Integer` | ✅ Required | Answer ID obtain from /INT/v1/Poll/ Answers API |
| `MSISDN` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. exec_code integer |

## Mock Responses

### GET — Casts a vote for a specific Answer of a Poll

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

### GET — Casts a vote for a specific Answer of a Poll

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Poll/Vote?auth:user=api_user&auth:pwd=api_password&param:AnswerID=ID-001234&param:MSISDN=0777777588"
```
