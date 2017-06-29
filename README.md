# Go Swagger rules for Bazel

## Setup

Add the following to your WORKSPACE file:

```bzl
git_repository(
    name = "com_github_tnarg_rules_go_swagger",
    remote = "https://github.com/tnarg/rules_go_swagger.git",
    tag = "0.1.0",
)

load("@com_github_tnarg_rules_go_swagger//go/swagger:def.bzl", "go_swagger_deps", "go_swagger_repositories", "go_swagger_repository")

go_swagger_deps()
go_swagger_repositories()
```

And then for each swagger.json file, add something like this WORKSPACE file:

```bzl
go_swagger_repository(
    name = "my_generated_repo",
    src = "//example:swagger.json",
    importpath = "github.com/example/petstore/generated",
)
```
