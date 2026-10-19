{{/*
    Criar as nossas tags
*/}}

{{- define "app.labels" -}}
app: {{ .labels.app | quote }}
env: {{ .labels.env | quote }}
live: {{ .labels.live | quote }}
{{- end }}

{{/*
    Definir os limits de recursos
*/}}
{{- define "app.resources" -}}
limits:
  cpu: {{ .resources.limits.cpu }}
  memory: {{ .resources.limits.memory }}
requests:
  cpu: {{ .resources.requests.cpu }}
  memory: {{ .resources.requests.memory }}
{{- end }}

{{/*
    Definir as portas dos containers
*/}}
{{- define "app.ports" -}}
{{- range .ports }}
- containerPort: {{ .port }}
{{- end }}
{{- end }}

{{/*
    Definindo os nossos configMaps
*/}}
{{- define "database.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-db-config
data:
  app-config.yaml: |
    {{- toYaml .config | nindent 4 }}
{{- end }}

{{- define "observability.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-observability-config
data:
  app-config.json: |
    {{- toJson .config | nindent 4 }}
{{- end }}