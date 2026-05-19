# CRM Subscriber Classification Rate

## Endpoint

```
GET /TIMM/v1/CRM/Subscriber/Classification/Rate
```

## Description

Retrieves the classification rate for a subscriber based on their MSISDN. Returns the subscriber's rate plan code and description (e.g. B2C Standard, B2B Corporate, etc.).

---

## Authentication

Provided as query parameters.

| Field       | Type   | Required | Description              |
|-------------|--------|----------|--------------------------|
| `auth:user` | string | Yes      | API username             |
| `auth:pwd`  | string | Yes      | API password / secret key |

---

## Request

### Method

`GET`

### Headers

| Header   | Value              |
|----------|--------------------|
| `Accept` | `application/json` |

### Query Parameters (`param`)

| Field          | Type   | Required | Description                                 |
|----------------|--------|----------|---------------------------------------------|
| `param:msisdn` | string | Yes      | Subscriber mobile number (e.g. `"07777777588"`) |

### Example Request

```bash
curl -X GET \
  "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Classification/Rate?auth:user=Avaya&auth:pwd=skOswKr0Q11M0nxMgLh7hKFR&param:msisdn=07777777588"
```

---

## Response

### Fields

| Field                    | Type   | Description                                           |
|--------------------------|--------|-------------------------------------------------------|
| `exec_code`              | int    | Execution code (`200` = success)                      |
| `exec_msg`               | string | Human-readable result message                         |
| `resultset.code`         | string | Classification rate code (e.g. `"111"`)               |
| `resultset.description`  | string | Rate plan description (e.g. `"B2C Standard"`)         |

### Example Response

```json
{
    "exec_code": 200,
    "exec_msg": "Success",
    "resultset": {
        "code": "111",
        "description": "B2C Standard"
    }
}
```

---

## Error Codes

| Code  | Message       | Description                        |
|-------|---------------|------------------------------------|
| `200` | Success       | Request completed successfully     |
| `-1`  | Auth Failed   | Invalid credentials                |
| `-2`  | Not Found     | Subscriber not found               |
