{{/*
Expand the name of the chart.
*/}}
{{- define "masa-odoo18.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "masa-odoo18.fullname" -}}
{{- printf "%s-odoo-%s" .Values.global.projectName .Values.global.environment | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Postgres fullname
*/}}
{{- define "masa-odoo18.postgresName" -}}
{{- printf "%s-postgres-%s" .Values.global.projectName .Values.global.environment | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "masa-odoo18.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/name: odoo
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/environment: {{ .Values.global.environment }}
app.kubernetes.io/project: {{ .Values.global.projectName }}
{{- end }}

{{/*
Selector labels for Odoo
*/}}
{{- define "masa-odoo18.selectorLabels" -}}
app.kubernetes.io/name: odoo
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for Postgres
*/}}
{{- define "masa-odoo18.postgresSelectorLabels" -}}
app.kubernetes.io/name: postgres
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
ServiceAccount name
*/}}
{{- define "masa-odoo18.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "masa-odoo18.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
