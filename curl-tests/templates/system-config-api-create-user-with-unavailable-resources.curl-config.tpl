request = "POST"
url = "http://192.168.19.139:11000/TIMM/v1/System/Config/API/Create/User?auth:user=#TIMM-API-USERNAME#&auth:pwd=#TIMM-API-PASSWORD#"
header = "Accept: application/json"
header = "Content-Type: application/json"
data-binary = "@curl-tests/generated/system-config-api-create-user-with-unavailable-resources.json"
silent
show-error
