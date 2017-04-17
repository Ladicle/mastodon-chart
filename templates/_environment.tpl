{{/*
Production environment for mastodon
*/}}
{{- define "productonEnvironment" -}}
- name: REDIS_HOST
  value: {{ template "redis.fullname" . | quote }}
- name: REDIS_PORT
  value: "6379"

# - name: REDIS_DB
#   value: "0"
- name: DB_HOST
  value: {{ template "postgres.fullname" . | quote }}
- name: DB_USER
  value: "postgres"
- name: DB_PASS
  valueFrom:
    secretKeyRef:
      name: {{ template "postgres.fullname" . }}
      key: postgres-password
- name: DB_NAME
  value: "postgres"
- name: DB_PORT
  value: "5432"

# Federation
- name: LOCAL_DOMAIN
  value: "example.com"
- name: LOCAL_HTTPS
  value: "true"
# - name: WEB_DOMAIN
#   value: "example.com"

# Registrations
# - name: SINGLE_USER_MODE
#   value: "true"
# - name: EMAIL_DOMAIN_BLACKLIST
#   value: "example1.com|example2.com"
# - name: EMAIL_DOMAIN_WHITELIST
#   value: "example1.com|example2.com"

# Optionally change default language
- name: DEFAULT_LOCAL
  value: "ja"

# E-mail configuration
- name: SMTP_SERVER
  value: "smtp.mailgun.org"
- name: SMTP_PORT
  value: "587"
- name: SMTP_LOGIN
  value: "dummy"
- name: SMTP_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ template "streaming.fullname" . }}
      key: smtpPassword
- name: SMTP_FROM_ADDRESS
  value: "notifications@example.com"
# - name: SMTP_DELIVERY_METHOD
#   value: "smtp"
# - name: SMTP_AUTH_METHOD
#   value: "plain"
# - name: SMTP_OPENSSL_VERIFY_MODE
#   value: "peer"
# - name: SMTP_ENABLE_STARTTLS_AUTO
#   value: "true"

# Optional user upload path and URL (images, avatars). Default is :rails_root/public/system. If you set this variable, you are responsible for making your HTTP server (eg. nginx) serve these files.
# - name: PAPERCLIP_ROOT_PATH
#   value: "/var/lib/mastodon/public-system"
# - name: PAPERCLIP_ROOT_URL
#   value: "/system"
# Optional asset host for multi-server setups
# - name: CDN_HOST
#   value: "assets.example.com"

# S3 (Minio Config (optional) Please check Minio instance for details)
# - name: S3_ENABLED
#   value: "true"
# - name: S3_BUCKET
#   value: "dummy"
# - name: AWS_ACCESS_KEY_ID
#   value: "dummy"
# - name: AWS_SECRET_ACCESS_KEY
#   value: "dummy"
# - name: S3_REGION
#   value: "dummy"
# - name: S3_PROTOCOL
#   value: "http"
# - name: S3_HOSTNAME
#   value: "192.168.1.123:9000"
# - name: S3_CLOUDFRONT_HOST
#   value: "dummy"
# - name: STREAMING_API_BASE_URL
#   value: "dummy"

# If you need to use pgBouncer, you need to disable prepared statements:
# - name: PREPARED_STATEMENTS
#   value: "false"

- name: SECRET_KEY_BASE
  valueFrom:
    secretKeyRef:
      name: {{ template "streaming.fullname" . }}
      key: secret-key-base
- name: OTP_SECRET
  valueFrom:
    secretKeyRef:
      key: otp-secret
- name: PAPERCLIP_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ template "streaming.fullname" . }}
      key: paperclip-secret
{{- end -}}
