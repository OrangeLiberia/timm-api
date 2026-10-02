# NumberRTKYC API

## Endpoint

```http
GET http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/NumberRTKYC
```

## Request

### cURL

```bash
curl -X GET "http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/NumberRTKYC?auth:user=KYCMobileValidation&auth:pwd=EKa8aC15zKaxV9ugMWAmy1zcr6&param:TIMMUserID=18105&param:MSISDN=0"
```

### Parameters

| Parameter | Example | Description |
|---|---|---|
| `auth:user` | `KYCMobileValidation` | API authentication username |
| `auth:pwd` | `********` | API authentication password |
| `param:TIMMUserID` | `18105` | TIMM user ID |
| `param:MSISDN` | `0` | MSISDN search parameter |

> **Security:** Do not commit real API passwords or credentials to GitHub. Use environment variables or a secrets-management solution.

---

# Response

The API returned:

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "Address": "Barnersville",
    "BirthDate": "1997-04-14 00:00:00.000",
    "BirthPlace": "Barnersville",
    "Country": "Liberia",
    "FirstName": "Joshua Cooper",
    "ID": "64736519",
    "IDCard": "0201300",
    "IDCardType": "Passport",
    "LastName": "George",
    "MSISDN": "0773843335",
    "PictureCONTRACT": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/... [BASE64 TRUNCATED]",
    "PictureFace": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/... [BASE64 TRUNCATED]",
    "PictureIDCARD": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/... [BASE64 TRUNCATED]",
    "PictureIDCARDBACK": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/... [BASE64 TRUNCATED]",
    "SubsID": "1025121835951"
  }
}
```

## Response Status

| Field | Value | Description |
|---|---:|---|
| `exec_code` | `200` | Successful API execution |
| `exec_msg` | `Success` | Execution status |

---

# Resultset Fields

| Field | Type | Description |
|---|---|---|
| `Address` | String | Customer address |
| `BirthDate` | DateTime | Customer date of birth |
| `BirthPlace` | String | Customer place of birth |
| `Country` | String | Customer country |
| `FirstName` | String | Customer first name |
| `ID` | String | Customer identification reference |
| `IDCard` | String | Identification document number |
| `IDCardType` | String | Identification document type |
| `LastName` | String | Customer surname |
| `MSISDN` | String | Customer mobile number |
| `PictureCONTRACT` | Base64 String | Contract/customer document image encoded as Base64 |
| `PictureFace` | Base64 String | Customer face photograph encoded as Base64 |
| `PictureIDCARD` | Base64 String | Front side of identification document encoded as Base64 |
| `PictureIDCARDBACK` | Base64 String | Back side of identification document encoded as Base64 |
| `SubsID` | String | Subscriber identifier |

---

# Image Fields

The API returns four image fields as **Base64-encoded strings**:

1. `PictureCONTRACT`
2. `PictureFace`
3. `PictureIDCARD`
4. `PictureIDCARDBACK`

## Important Documentation Note

The Base64 values shown in this documentation are **samples only**.

The original Base64 image data is very large, therefore the values have been intentionally **truncated** and replaced with:

```text
... [BASE64 TRUNCATED]
```

The examples are **not complete Base64 images** and cannot be decoded into valid images.

The actual API response contains the complete Base64 string.

---

# Base64 Image Format

The image values start with:

```text
/9j/4AAQSkZJRgABAQAAAQABAAD/
```

This is consistent with a Base64-encoded JPEG image.

To convert a complete Base64 value into an image, the application can decode the Base64 string and save the resulting binary data as a `.jpg` file.

## JavaScript Example

```javascript
const fs = require("fs");

function saveBase64Image(base64, filename) {
    const buffer = Buffer.from(base64, "base64");
    fs.writeFileSync(filename, buffer);
}

saveBase64Image(resultset.PictureFace, "face.jpg");
```

## Browser Example

If the Base64 value is complete:

```javascript
const image = document.createElement("img");

image.src = `data:image/jpeg;base64,${resultset.PictureFace}`;

document.body.appendChild(image);
```

---

# Example Response Structure

```text
exec_code
└── 200

exec_msg
└── Success

resultset
├── Address
├── BirthDate
├── BirthPlace
├── Country
├── FirstName
├── ID
├── IDCard
├── IDCardType
├── LastName
├── MSISDN
├── PictureCONTRACT
├── PictureFace
├── PictureIDCARD
├── PictureIDCARDBACK
└── SubsID
```

---

# Error Handling

Applications should verify `exec_code` before processing `resultset`.

### Successful Response

```json
{
  "exec_code": 200,
  "exec_msg": "Success"
}
```

If `exec_code` is different from `200`, the application should treat the request as unsuccessful and inspect `exec_msg` for the error description.

---

# Security Considerations

This API response contains sensitive customer/KYC information, including:

- Personal identification information
- Date of birth
- Mobile number
- Identification document information
- Face photograph
- Identification document images
- Contract/document images

Therefore:

- **Do not** commit real API responses containing customer data to a public GitHub repository.
- **Do not** commit API passwords or authentication tokens.
- Use anonymized or synthetic data in documentation.
- Keep complete Base64 images outside source-control documentation.
- Store credentials in environment variables or a secrets-management system.
- Apply appropriate access controls to API logs and application logs.
- Avoid logging the complete `Picture*` fields.

---

# API Summary

| Property | Value |
|---|---|
| Method | `GET` |
| Endpoint | `/TIMM/v1/CRM/Subscriber/KYC/NumberRTKYC` |
| Authentication | Query-string authentication parameters |
| Input | `TIMMUserID`, `MSISDN` |
| Success Code | `200` |
| Response Format | JSON |
| Image Format | Base64-encoded JPEG |
| Image Fields | 4 |
| Image Samples | Truncated for documentation |
| KYC Data | Yes |

> **Note:** The response shown in this documentation is based on an API response example. The `PictureCONTRACT`, `PictureFace`, `PictureIDCARD`, and `PictureIDCARDBACK` Base64 values are intentionally incomplete because the full image data is too large for documentation.
