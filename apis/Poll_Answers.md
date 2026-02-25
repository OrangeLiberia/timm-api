# Poll/Answers

This method is called to obtain questions available for a specific Polls.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Provides the current questions for a specific poll. |

## Endpoint URL

```
TIMM/v1/Poll/Answers
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Poll/Answers` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Poll/Answers` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `PollingID` | `Integer` | ✅ Required | Polling ID obtain from /INT/v1/Poll/Active API exec_code integer |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `PollingID` | `Integer` | Unique Polling ID |
| `AnswerID` | `Integer` | Unique Answer ID |
| `Answer` | `String` | Selection answer to be presented |

## Mock Responses

### GET — Provides the current questions for a specific poll.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "PollingID": 1,
    "AnswerID": 1,
    "Answer": "sample_Answer"
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

### GET — Provides the current questions for a specific poll.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Poll/Answers?auth:user=api_user&auth:pwd=api_password&param:PollingID=ID-001234"
```
