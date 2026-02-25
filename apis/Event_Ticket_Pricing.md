# Event/Ticket/Pricing

This method is called to either GET the pricing details of a ticket OR to calculate (POST) the pricing of certain ticket

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Calculates the pricing for a set of tickets |
| `GET` | Retrives the pricing for a set of tickets |

## Endpoint URL

```
/TIMM/v1/Event/Ticket/Pricing
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Event/Ticket/Pricing` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Pricing` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `EventID` | `String` | ✅ Required | Unique Event Ticket ID |
| `Currency` | `String` | ✅ Required | Currency: - Qty |
| `USD, LD` | `Integer` | ✅ Required | Quantity of Tickets exec_code integer |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `EventID` | `Integer` | Unique Event Ticket ID |
| `Amount` | `String` | Individual Ticket Price |
| `Currency` | `String` | Currency: USD / LD |
| `Qty` | `Integer` | Quantity of Tickets |
| `TotalAmount` | `String` | Total Amount |

## Mock Responses

### POST — Calculates the pricing for a set of tickets

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "EventID": 1,
    "Amount": 100.0,
    "Currency": "LRD",
    "Qty": 1,
    "TotalAmount": 100.0
  }
}
```

### GET — Retrives the pricing for a set of tickets

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "EventID": 1,
    "Amount": 100.0,
    "Currency": "LRD",
    "Qty": 1,
    "TotalAmount": 100.0
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

### POST — Calculates the pricing for a set of tickets

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Pricing" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "EventID": "ID-001234",
    "Currency": "LRD",
    "USD, LD": 1
  }
}'
```

### GET — Retrives the pricing for a set of tickets

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Pricing?auth:user=api_user&auth:pwd=api_password&param:EventID=ID-001234&param:Currency=LRD&param:USD, LD=1"
```
