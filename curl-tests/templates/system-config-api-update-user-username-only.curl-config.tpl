request = "POST"
url = "https://api-dev.example.invalid/TIMM/v1/System/Config/API/Update/User"
user = "#TIMM-API-USERNAME#:#TIMM-API-PASSWORD#"
header = "Accept: application/json"
header = "Content-Type: application/json"
data-binary = "@curl-tests/generated/system-config-api-update-user-username-only.json"
silent
show-error
