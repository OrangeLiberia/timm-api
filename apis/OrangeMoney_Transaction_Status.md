# OrangeMoney/Transaction/Status

This method allows to check the status of a transaction.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the status of an Orange Money transaction |

## Endpoint URL

```
/TIMM/v1/OM/Transaction/Status
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/OM/Transaction/Status` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/OM/Transaction/Status` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}, "param":{ "TXNID":"MP260320.0112.B39728", "CURRENCY":"LRD" }}
```


## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `TXNID` | `String` | ✅ Required | Orange Money Transaction Id. |
| `Currency` | `EnumString` | ✅ Required | Identification of Wallet being charged: - USD, LD |
| `TXNTYPE` | `EnumString` | ⬜ Optional | Defines that an extended status check on the transaction will be executed: XPRESSTOKEN |


### GET — Gets the status of an Orange Money transaction

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/OM/Transaction/Status?auth:user=api_user&auth:pwd=api_password&param:TXNID=MP260320.0112.B39728&param:CURRENCY=LRD"
```

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "TXNSTATUS": "TS"
  }
}
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `TXNSTATUS` | `String` | Orange Money Transaction Status: TS - Transaction Successful; TF - Transaction Failed; TI - Transaction Pending |


### GET — Gets the status of an Orange Money transaction for XPressToken

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/OM/Transaction/Status?auth:user=api_user&auth:pwd=api_password&param:TXNID=MP260320.0112.B39728&param:CURRENCY=LRD&param:TXNTYPE=XPRESSTOKEN"
```

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "TXNSTATUS": "TS",
    "TOKENSTATUS": "Transaction Completed",
    "TOKEN":"Token Data"
  }
}
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `TXNSTATUS` | `String` | Orange Money Transaction Status: TS - Transaction Successful; TF - Transaction Failed; TI - Transaction Pending |
| `TOKENSTATUS` | `EnumString` | Status of Token: Transaction failed; Transaction accepted; Transaction Completed; ... |
| `TOKEN` | `String` | xPress Token  |




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

