# Poll/Active

This method is called to obtain current Active Polls.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Provides the current active list of polls. |

## Endpoint URL

```
TIMM/v1/Poll/Active
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Poll/Active` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Poll/Active` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `PollingType` | `String` | ⬜ Optional | Allows to get active pools, filtered by type. |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `PollingID` | `String` | Unique Polling ID StartDt DateTime Start Date for Polling Format: YYYY-MM-DD HH:MM:SS EndDt DateTime End Date for Polling Format: YYYY-MM-DD HH:MM:SS |

## Mock Responses

### GET — Provides the current active list of polls.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "PollingID": "sample_PollingID"
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

### GET — Provides the current active list of polls.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Poll/Active?auth:user=api_user&auth:pwd=api_password&param:PollingType=<PollingType>"
```
