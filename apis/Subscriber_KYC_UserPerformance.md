# TIMM KYC API — User Performance

## Overview

Returns the current KYC performance information for a specific user.

The endpoint provides:

- Number of items currently in the user's **Queue**
- Number of **Validations** performed by the user

## Endpoint

**Method:** `GET`

```text
http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/UserPerformance
```

## Authentication

Authentication is provided through query parameters:

| Parameter | Required | Description | Example |
|---|---:|---|---|
| `auth:user` | Yes | API authentication username | `KYCMobileValidation` |
| `auth:pwd` | Yes | API authentication password | `********` |

> **Security:** Do not commit the real `auth:pwd` value to GitHub. Use an environment variable or secret management solution instead.

## Parameters

| Parameter | Required | Description | Example |
|---|---:|---|---|
| `auth:user` | Yes | API authentication user | `KYCMobileValidation` |
| `auth:pwd` | Yes | API authentication password | `********` |
| `param:UserID` | Yes | KYC user ID for which performance is requested | `10486` |

## cURL Example

```bash
curl -X GET "http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/UserPerformance?auth:user=KYCMobileValidation&auth:pwd=YOUR_PASSWORD&param:UserID=10486"
```

### Using an environment variable

For better security:

```bash
curl -X GET "http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/UserPerformance?auth:user=KYCMobileValidation&auth:pwd=${TIMM_AUTH_PWD}&param:UserID=10486"
```

## Response

### Successful Response

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "Queue": "59",
    "Validations": "0"
  }
}
```

## Response Fields

### Root Object

| Field | Type | Description |
|---|---|---|
| `exec_code` | Integer | Execution status code. `200` indicates successful execution. |
| `exec_msg` | String | Execution status message. |
| `resultset` | Object | Contains the user performance information. |

### `resultset`

| Field | Type | Description |
|---|---|---|
| `Queue` | String | Number of KYC records currently assigned/in the user's queue. |
| `Validations` | String | Number of validations performed by the user. |

## Example

For:

```text
UserID = 10486
```

The API returned:

```text
Queue       = 59
Validations = 0
```

This means that user `10486` currently has **59 items in the queue** and **0 validations** recorded in the returned performance data.

## API Status

| Code | Meaning |
|---:|---|
| `200` | Request executed successfully |

> Note: `exec_code` is an application-level response code returned by TIMM. The HTTP status code should also be checked by the client.

## JavaScript Example

```javascript
const userId = 10486;
const username = "KYCMobileValidation";
const password = process.env.TIMM_AUTH_PWD;

const url =
  `http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/UserPerformance` +
  `?auth:user=${encodeURIComponent(username)}` +
  `&auth:pwd=${encodeURIComponent(password)}` +
  `&param:UserID=${encodeURIComponent(userId)}`;

const response = await fetch(url);

if (!response.ok) {
  throw new Error(`HTTP error: ${response.status}`);
}

const data = await response.json();

console.log("Queue:", data.resultset.Queue);
console.log("Validations:", data.resultset.Validations);
```

## Notes

- `UserID` identifies the KYC user whose performance is being queried.
- The API returns `Queue` and `Validations` as strings rather than numeric JSON values.
- Credentials should not be hard-coded in source code or committed to Git.
- Prefer environment variables such as `TIMM_AUTH_PWD` for authentication credentials.
