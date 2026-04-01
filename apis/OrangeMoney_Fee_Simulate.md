# OrangeMoney/Fee/Simulate

This method executes a simulation of one of the events returning details about the fee the total cost and a user-friendly message of the simulation.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Executes a simulation for an item base |

## Endpoint URL

```
/TIMM/v1/OM/Fee/Simulate
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/OM/Fee/Simulate` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/OM/Fee/Simulate` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ItemID` | `String` | ✅ Required | Item Base ID |
| `Currency` | `Integer` | ✅ Required | Identification of Wallet Currency being simulated: USD, LD |
| `Amount` | `Integer` | ✅ Required | Amount value to simulate exec_code integer |

## Mock Responses

### POST — Executes a simulation for an item base

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "status": "Active",
    "iccid": "892310700000000780"
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

### POST — Executes a simulation for an item base

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/OM/Fee/Simulate" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "ItemID": "ID-001234",
    "Currency": "LRD",
    "Amount": 100.0
  }
}'
```
