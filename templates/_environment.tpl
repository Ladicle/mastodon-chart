{{/*
Production environment for mastodon
*/}}
{{- define "productonEnvironment" -}}
- name: REDIS_HOST
  value: "{{ template "redis.fullname" . }}"
- name: REDIS_PORT
  value: "{{ .Values.redis.servicePort }}"
- name: DB_HOST
  value: "{{ template "postgres.fullname" . }}"
- name: DB_USER
  value: "postgres"
- name: DB_PASS
  valueFrom:
    secretKeyRef:
      name: {{ template "postgres.fullname" . }}
      key: postgres-password
- name: DB_NAME
  value: "postgres"
- name: SAFETY_ASSURED
  value: "1"
- name: RAILS_SERVE_STATIC_FILES
  value: "true"
- name: WEB_CONCURRENCY
  value: "{{ .Values.web.concurrency }}"
- name: MAX_THREADS
  value: "{{ .Values.web.maxThreads }}"
- name: STREAMING_CLUSTER_NUM
  value: "{{ .Values.streaming.clusterSize }}"
- name: DB_PORT
  value: "{{ .Values.postgres.servicePort }}"
- name: LOCAL_DOMAIN
  value: "{{ .Values.web.ingress.host }}"
- name: LOCAL_HTTPS
  value: "false"
- name: SINGLE_USER_MODE
  value: "{{ .Values.env.singleUserMode }}"
{{- if .Values.env.registration }}
- name: EMAIL_DOMAIN_BLACKLIST
  value: "{{ .Values.env.registration.emailDomainBlacklist }}"
- name: EMAIL_DOMAIN_WHITELIST
  value: "{{ .Values.env.registration.emailDomainWhitelist }}"
{{- end }}
- name: DEFAULT_LOCAL
  value: "{{ .Values.env.defaultLanguage }}"
- name: SMTP_SERVER
  value: "{{ .Values.env.smtp.server }}"
- name: SMTP_PORT
  value: "{{ .Values.env.smtp.port }}"
- name: SMTP_LOGIN
  value: "{{ .Values.env.smtp.login }}"
- name: SMTP_OPENSSL_VERIFY_MODE
  value: "{{ .Values.env.smtp.opensslVerifyMode }}"
- name: SMTP_DOMAIN
  value: "{{ .Values.env.smtp.domain }}"
- name: SMTP_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ template "web.fullname" . }}
      key: smtpPassword
- name: SMTP_FROM_ADDRESS
  value: "{{ .Values.env.smtp.address }}"
{{- if .Values.env.assets -}}
- name: PAPERCLIP_ROOT_PATH
  value: "{{ .Values.env.assets.paperclipRootPath }}"
- name: PAPERCLIP_ROOT_URL
  value: "{{ .Values.env.assets.paperclipRootUrl }}"
- name: CDN_HOST
  value: "{{ .Values.env.assets.cdnHost }}"
{{- end }}
{{- if .Values.env.s3 -}}
- name: S3_ENABLED
  value: "{{ .Values.env.s3.enabled }}"
- name: S3_BUCKET
  value: "{{ .Values.env.s3.bucket }}"
- name: AWS_ACCESS_KEY_ID
  value: "{{ .Values.env.s3.awsAccessKeyId }}"
- name: AWS_SECRET_ACCESS_KEY
  value: "{{ .Values.env.s3.awsSecretAccessKey }}"
- name: S3_REGION
  value: "{{ .Values.env.s3.region }}"
- name: S3_PROTOCOL
  value: "{{ .Values.env.s3.protocol }}"
- name: S3_HOSTNAME
  value: "{{ .Values.env.s3.hostname }}"
- name: S3_CLOUDFRONT_HOST
  value: "{{ .Values.env.s3.cloudfrontHost }}"
- name: STREAMING_API_BASE_URL
  value: "{{ .Values.env.s3.streamingApiBaseUrl }}"
{{- end }}
- name: SECRET_KEY_BASE
  valueFrom:
    secretKeyRef:
      name: {{ template "web.fullname" . }}
      key: secretKeyBase
- name: OTP_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ template "web.fullname" . }}
      key: otpSecret
- name: PAPERCLIP_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ template "web.fullname" . }}
      key: paperclipSecret
{{- end -}}

