# JungleEnergy/Account

This method will allows to obtain the details of an account on JungleEnergy system.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows for a caller to get JungleEnergy Account information |

## Endpoint URL

```
INT/v1/JungleEnergy/Account
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/INT/v1/JungleEnergy/Account` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/INT/v1/JungleEnergy/Account` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MeterID` | `String` | ✅ Required | Unique identifier of the Meter we are querying |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing JungleEnergy account information |
| `resultset.ExecTxt` | `String` | Execution text returned by JungleEnergy system |
| `resultset.METERPAN` | `String` | Meter PAN |
| `resultset.NAME` | `String` | Subscriber name |
| `resultset.ORGANIZATION` | `String` | Organization |
| `resultset.CHANNELFEE` | `String` | Channel fee |
| `resultset.TARIFFRATE` | `String` | Tariff rate |
| `resultset.ISSEEN` | `String` | Seen status |
| `resultset.ISREGISTERED` | `String` | Registration status |
| `resultset.FIXEDCHARGE` | `String` | Fixed charge |
| `resultset.FIXEDCHARGEMONTHS` | `String` | Fixed charge months |

## Responses

### GET — Allows for a caller to get JungleEnergy Account information

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ExecTxt": "Success",
    "METERPAN": "600727251226435855",
    "NAME": "Richardson  Dolowai",
    "ORGANIZATION": "Dinkimo  Town",
    "CHANNELFEE": "$0.0",
    "TARIFFRATE": "NOT SET",
    "ISSEEN": "1",
    "ISREGISTERED": "1",
    "FIXEDCHARGE": "1.500000",
    "FIXEDCHARGEMONTHS": "0"
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
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### GET — Allows for a caller to get JungleEnergy Account information

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/INT/v1/JungleEnergy/Account?auth:user=api_user&auth:pwd=api_password&param:MeterID=12453974394"
```
