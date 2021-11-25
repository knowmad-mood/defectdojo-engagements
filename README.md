# DefectDojo Engagements ( GitHub Action )

This action creates engagementos in your DefectDojo dashboard.

# What's new

- Create engagement

# Usage

See [action.yml](action.yml)

### Upload Report
```yaml
steps:
- name: Create new engagement
  id: engagements
  uses: ivanamat/defectdojo-engagements@v1
  with:
    token: ${{ github.event.inputs.defectdojo_token }}
    defectdojo_url: ${{ github.event.inputs.defectdojo_url }}
    defectdojo_endpoint: ${{ github.event.inputs.defectdojo_endpoint }}
    name: ${{ github.event.inputs.name }}
    description: ${{ github.event.inputs.description }}
    version: ${{ github.event.inputs.version }}
    target_start: ${{ github.event.inputs.target_start }}
    target_end: ${{ github.event.inputs.target_end }}
    product: ${{ github.event.inputs.product }}
- name: Show response
  run: |
    set -e
    printf '%s\n' '${{ steps.engagements.outputs.response }}'
```
### Parameters
There are available the same parameters that are specified in your DefectDojo panel documentation ( https://defectdojo.mydomain.com/api/v2/doc/ ). Don't forget to see [action.yml](action.yml) for more information.

In addition you can provide defectdojo_endpoint where you can specify the engagements endpoint if is different than /api/v2/engagements/.

### Outputs

- **response:** This output returns the DefectDojo's API response. Usually, return the import result as a JSON string.

# Limitations
This action has the same limitations as your DefectDojo dashboard API. This action only executes a CURL to your DefectDojo's API engagements endpoint with the params you have provided.

```bash
curl -v -X POST "$INPUT_DEFECTDOJO_URL$INPUT_DEFECTDOJO_ENDPOINT" -H "Authorization: Token $INPUT_TOKEN" -H "accept: application/json" -H  "Content-Type: multipart/form-data" -F '...'
```
See [entrypoint.sh](entrypoint.sh)

### Additional Documentation

DefectDojo official documentation https://defectdojo.github.io/django-DefectDojo/

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
