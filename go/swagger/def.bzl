load("@com_github_tnarg_rules_go_swagger//go/swagger/private:go_swagger_deps.bzl", _go_swagger_deps = "go_swagger_deps")
load("@com_github_tnarg_rules_go_swagger//go/swagger/private:repositories.bzl", _go_swagger_repositories = "go_swagger_repositories")
load("@com_github_tnarg_rules_go_swagger//go/swagger/private:go_swagger_repository.bzl", _go_swagger_repository = "go_swagger_repository")
go_swagger_deps = _go_swagger_deps
go_swagger_repositories = _go_swagger_repositories
go_swagger_repository = _go_swagger_repository