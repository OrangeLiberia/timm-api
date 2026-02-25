# SIMREG/Agent/Statistics

This method returns the registration statistics of the Agent. The statistics are grouped into three distinct groups. For information less than 6 months, a daily statistic is returned. Monthly statistics will be returned for statistics older than 6 months to the closer base year. For the rest of the data that will be grouped by yearly.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Executes a simulation for an item base |

## Endpoint URL

```
/TIMM/v1/SIMREG/Agent/Statistics
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/SIMREG/Agent/Statistics` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/SIMREG/Agent/Statistics` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `AGENTID` | `String` | ✅ Required | Agent ID exec_code integer |

## Mock Responses

### GET — Executes a simulation for an item base

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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### GET — Executes a simulation for an item base

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/SIMREG/Agent/Statistics?auth:user=api_user&auth:pwd=api_password&param:AGENTID=ID-001234"
```
