# Act Cheat Sheet

## Configuration

Optional to configure act in `.actrc`

```
-P Linux=ubuntu-latest
```

## Simple usage

- List available workflows `act -l`
- Run act `act [event] (options)`
- Events : `push`, `pull_request`, `workflow_dispatch`, `workflow_call`, ...
  > [Docs for all](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)

## Inputs and Secrets

- Set secret `-s secret_name=secret_value`
- Set input `-i input_name=input_value`
- Secret from file `--secret-file .secrets`
- Input file `--input-file .inputs`
  > Same for var and envs

## Run specific Jobs

- Run specific Job `-j job_name`
- Run specific Workflow `-W .github/workflows/name.yaml`
  > `-j` and `-W` Can be combined

## Pull Request

Every [GitHub event](https://developer.github.com/v3/activity/events/types) is accompanied by a payload. You can provide these events in JSON format with the `--eventpath` to simulate specific GitHub events kicking off an action. For example:

```
{
  "pull_request": {
    "head": {
      "ref": "sample-head-ref"
    },
    "base": {
      "ref": "sample-base-ref"
    }
  }
}
```

```
act pull_request -e pull-request.json
```

Act will properly provide `github.head_ref` and `github.base_ref` to the action as expected.
