# OrangeMoney/Transactions/Rollback

This method allows the Subscriber to rollback an eligible Orange Money transaction.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Rolls back an eligible Orange Money transaction. |

## Endpoint URL

```
TIMM/v1/OM/Transactions/Rollback
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/OM/Transactions/Rollback` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/OM/Transactions/Rollback` |

## Authentication

Authentication credentials must be provided on every request as a JSON `auth` object in the request body.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number of the Subscriber requesting the rollback. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of the Orange Money wallet containing the transaction: USD, LRD. |
| `TXNID` | `String` | ✅ Required | Orange Money Transaction ID to rollback. |
| `PAYERPIN` | `String` | ✅ Required | Orange Money PIN used to authorize the rollback. |
| `COMMENT` | `String` | ✅ Required | Comment recorded as the reason for the rollback. |

## Rollback Processing

| Transaction Age | Processing | Successful Result |
|-----------------|------------|-------------------|
| Less than 1 hour | Full rollback | Returns `CORRITXID` and `CORRATXID`. |
| From 1 hour up to 72 hours | Initiates the rollback only | Returns `CORRITXID`. |
| More than 72 hours | Transaction has expired | Rollback is rejected. |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `CORRITXID` | `String` | Orange Money Transaction Correction Init ID. |
| `CORRATXID` | `String` | Orange Money Transaction Correction Commit ID. Returned when a full rollback is completed. |

The successful response is polymorphic. Fields not applicable to the executed rollback stage are omitted.

## Mock Responses

### GET — Full rollback completed

This response is returned when the transaction is less than 1 hour old.

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "CORRITXID": "TC260730.1611.B71385",
    "CORRATXID": "TC260730.1611.B71385"
  }
}
```

### GET — Rollback initiated

When the transaction is more than 1 hour and less than 72 hours old, the response contains `CORRITXID` only.

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "CORRITXID": "TC260730.1611.B71385"
  }
}
```

### GET — Rollback failed

```json
{
  "exec_code": -2000,
  "exec_msg": "Execution Error: Rollback failed"
}
```

## Error Responses

The API can return the following rollback-specific errors:

- `Invalid Transaction ID structure`
- `Transaction ID not allowed for rollback.`
- `Transaction ID has expired`

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
| `-2000` | General Error / Rollback Execution Error |

## cURL Examples

### GET — Rolls back an eligible Orange Money transaction

```bash
curl -k -X GET \
  "https://192.168.19.200:11003/TIMM/v1/OM/Transactions/Rollback" \
  -H "Content-Type: application/json" \
  --data '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "CURRENCY": "USD",
    "TXNID": "PP260730.1207.A10570",
    "PAYERPIN": "0000",
    "COMMENT": "Rollback request"
  }
}'
```
