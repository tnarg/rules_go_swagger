workspace(name="com_github_tnarg_rules_go_swagger")

git_repository(
    name = "io_bazel_rules_go",
    remote = "https://github.com/bazelbuild/rules_go.git",
    tag = "0.5.0",
)

load("@io_bazel_rules_go//go:def.bzl", "go_repositories")

go_repositories(go_version="1.8.3")

load("@com_github_tnarg_rules_go_swagger//go/swagger:def.bzl", "go_swagger_deps", "go_swagger_repositories", "go_swagger_repository")

go_swagger_deps()
go_swagger_repositories()

go_swagger_repository(
    name = "petstore",
    src = "@com_github_tnarg_rules_go_swagger//example:swagger.json",
    importpath = "github.com/tnarg/rules_go_swagger/example/generated"
)

