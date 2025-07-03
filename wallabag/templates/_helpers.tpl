{{/*
Łączy wszystkie typowe labele
*/}}
{{- define "wallabag.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Nazwa release + chart
*/}}
{{- define "wallabag.fullname" -}}
{{ include "wallabag.name" . }}-{{ .Release.Name }}
{{- end }}

{{/*
Skrócona nazwa
*/}}
{{- define "wallabag.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/*
Secret z hasłem bazy
*/}}
{{- define "wallabag.databaseSecretName" -}}
{{- if .Values.database.existingSecret }}
{{ .Values.database.existingSecret }}
{{- else }}
{{ include "wallabag.fullname" . }}-db
{{- end }}
{{- end }}
