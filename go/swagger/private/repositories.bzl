_GO_SWAGGER_REPOSITORY_TOOLS_BUILD_FILE = """
package(default_visibility = ["//visibility:public"])
filegroup(
    name = "swagger",
    srcs = ["bin/swagger"],
)
"""

def _go_swagger_repository_tools_impl(ctx):
    if ctx.os.name == 'linux':
        swagger_url = "https://github.com/go-swagger/go-swagger/releases/download/0.10.0/swagger_linux_amd64"
    elif ctx.os.name == 'mac os x':
        swagger_url = "https://github.com/go-swagger/go-swagger/releases/download/0.10.0/swagger_darwin_amd64"
    else:
        fail("Unsupported operating system: " + ctx.os.name)

    ctx.download(swagger_url, 'bin/swagger', executable=True)

    ctx.file('BUILD.bazel', _GO_SWAGGER_REPOSITORY_TOOLS_BUILD_FILE, False)

go_swagger_repository_tools = repository_rule(_go_swagger_repository_tools_impl)

def go_swagger_repositories():
    go_swagger_repository_tools(name = "com_github_tnarg_rules_go_swagger_repository_tools")
