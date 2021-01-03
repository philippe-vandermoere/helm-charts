{{/*
Expand the name of the chart.
*/}}
{{- define "symfony.name" -}}
{{- default .Chart.Name .Values.nameOverride  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "symfony.fullname" -}}
    {{- if .Values.fullnameOverride -}}
        {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
        {{- $name := default .Chart.Name .Values.nameOverride -}}
        {{- if contains $name .Release.Name -}}
            {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
        {{- else -}}
            {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "symfony.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels.
*/}}
{{- define "symfony.labels" -}}
app.kubernetes.io/name: {{ include "symfony.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.version }}
app.kubernetes.io/version: {{ .Values.version }}
{{- end }}
helm.sh/chart: {{ include "symfony.chart" . }}
{{- end -}}

{{/*
Labels to use on deployment.spec.selector.matchLabels and service.spec.selector
*/}}
{{- define "symfony.matchLabels" -}}
app.kubernetes.io/name: {{ include "symfony.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Generate init container
*/}}
{{- define "symfony.initContainers.waiting" -}}
{{- $timeout := .Values.dependencies.timeout -}}
{{- $imageRepository := .Values.dependencies.image.repository -}}
{{- $imageTag := .Values.dependencies.image.tag -}}
{{- $imagePolicy := .Values.dependencies.image.pullPolicy -}}
{{- range .Values.dependencies.services }}
- name: waiting-{{ .name }}
  image: {{ $imageRepository }}:{{ $imageTag }}
  imagePullPolicy: {{ $imagePolicy }}
  command: ['/bin/timeout']
  args:
    - '{{ $timeout }}'
    - '/bin/sh'
    - '-c'
    - 'while true; do nc {{ .host }} {{ .port }} -w 1 -z && break; sleep 1; done'
{{- end -}}
{{- end -}}

{{/*
Generate secret for environment variables
*/}}
{{- define "symfony.secret.env" -}}
{{- $env := dict -}}
{{- $env = mustMergeOverwrite $env .global.Values.env -}}
{{- if .context.env }}
{{- $env := mustMergeOverwrite $env .context.env -}}
{{- end }}
{{- range $key, $value := $env }}
{{ $key }}: {{ $value | b64enc | quote }}
{{- end }}
{{- end -}}

{{/*
Renders a value that contains template.
Usage:
{{ include "symfony.tplvalues.render" (dict "value" .Values.path.to.the.Value "global" $) }}
*/}}
{{- define "symfony.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .global }}
    {{- else }}
        {{- tpl (.value | toYaml) .global }}
    {{- end }}
{{- end -}}
