# SaveDocument API

## Endpoint

```http
POST http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/SaveDocument
```

## Request

### cURL

```bash
curl -X POST "http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/SaveDocument?auth:user=KYCMobileValidation&auth:pwd=YOUR_API_PASSWORD&param:IDSimReg=33333&param:TimmUserID=18089&param:MSISDN=0777567588&param:DocumentType=Passport&param:IDDocumentType=5&param:DocumentNumber=88888"
```

> Replace `YOUR_API_PASSWORD` with the API password in your secure environment. Avoid committing credentials or real customer information to source control.

### Parameters

| Parameter | Example | Description |
|---|---|---|
| `auth:user` | `KYCMobileValidation` | API authentication username |
| `auth:pwd` | `********` | API authentication password |
| `param:IDSimReg` | `33333` | SIM registration ID |
| `param:TimmUserID` | `18089` | TIMM user ID |
| `param:MSISDN` | `0777567588` | Customer mobile number |
| `param:DocumentType` | `Passport` | Document type |
| `param:IDDocumentType` | `5` | Document type identifier |
| `param:DocumentNumber` | `88888` | Identification document number |

---

# Response

The API returned:

```json
{
  "exec_code": 200,
  "exec_msg": "Success"
}
```

## Response Status

| Field | Value | Description |
|---|---:|---|
| `exec_code` | `200` | Successful API execution |
| `exec_msg` | `Success` | Execution status |

---

# Error Handling

Applications should check `exec_code` before treating the request as successful.

- `exec_code = 200`: the API reports success.
- Any other value: treat the request as unsuccessful and inspect `exec_msg` for the error description.

Only the successful response shown above was provided; other error codes and responses are not documented here.

---

# Security Considerations

This request contains authentication credentials and customer identification information.

- Do not commit real API passwords or credentials to GitHub.
- Use environment variables or a secrets-management solution for credentials.
- Use anonymized or synthetic customer data in documentation and test examples.
- Avoid logging complete query strings containing credentials or personal information.

---

# API Summary

| Property | Value |
|---|---|
| Method | `POST` |
| Endpoint | `/TIMM/v1/CRM/Subscriber/KYC/SaveDocument` |
| Authentication | Query-string authentication parameters |
| Input | `IDSimReg`, `TimmUserID`, `MSISDN`, `DocumentType`, `IDDocumentType`, `DocumentNumber` |
| Success Code | `200` |
| Response Format | JSON |
