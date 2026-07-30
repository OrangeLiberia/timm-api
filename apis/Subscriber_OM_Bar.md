# Subscriber/OM/Bar

This method allows barring of a Subscriber Orange Money wallet as sender, receiver, or both.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Bars the Subscriber Orange Money wallet. |

## Endpoint URL

```
TIMM/v1/OM/Subscriber/Bar
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `http://192.168.19.139:11100/TIMM/v1/OM/Subscriber/Bar` |
| Dev/Test | `http://192.168.19.139:11100/TIMM/v1/OM/Subscriber/Bar` |

## Authentication

Authentication credentials must be provided on every request as a JSON `auth` object in the request body.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone number of the Subscriber whose Orange Money wallet will be barred. |
| `CURRENCY` | `EnumString` | ✅ Required | Wallet currency. Accepted input values are `LRD`, `LD`, and `USD`. `LRD` and `LD` map to `lrd`; `USD` maps to `lsd`. |
| `COMMENT` | `String` | ✅ Required | Comment recorded as the reason for barring the wallet. |

The API currently applies these configured values automatically:

| Parameter | Value |
|-----------|-------|
| `ADDONID` | `olr05aa10shuPRdlusr` |
| `PROVIDER` | `101` |
| `USERTYPE` | `CUSTOMER` |
| `BARRINGDIRECTION` | `BOTH` (`BLK_PR_B`) |

The configured barring-direction mappings are `BOTH` → `BLK_PR_B`, `SENDER` → `BLK_PR_S`, and `RECEIVER` → `BLK_PR_R`. The current API definition defaults to `BOTH` and does not expose `BARRINGDIRECTION` as a caller parameter.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `ExecTxt` | `String` | Execution result returned by the Orange Money platform. |
| `Message` | `String` | Human-readable result of the barring request. |
| `TxNID` | `String` | Orange Money transaction reference. |
| `internal_code` | `String` | Internal result code returned by the Orange Money platform. |
| `mapping_code` | `String` | TIMM mapping result code. |

## Response Example

**Success Response (`exec_code: 200`):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ExecTxt": "ok",
    "Message": "User already barred as sender and receiver.",
    "TxNID": "BU260717.0848.X00003",
    "internal_code": "2103",
    "mapping_code": "SUCCESS"
  }
}
```

## cURL Example

```bash
curl -X POST \
  "http://192.168.19.139:11100/TIMM/v1/OM/Subscriber/Bar" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "CURRENCY": "LRD",
    "COMMENT": "Comment"
  }
}'
```
