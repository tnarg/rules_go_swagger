def _go_swagger_repository_impl(ctx):
    fake_repo = "src/" + ctx.attr.importpath

    result = env_execute(ctx, ["mkdir", "-p", fake_repo])
    if result.return_code:
        fail("failed to make GOPATH: %s" % (result.stderr,))

    result = env_execute(ctx, ["mkdir", "-p", fake_repo + "/models"])
    if result.return_code:
        fail("failed to make model dir: %s" % (result.stderr,))

    swagger = ctx.path(ctx.attr._swagger)
    cmd = "cd src; %s generate server -f %s -t %s --exclude-main" % (swagger, ctx.path(ctx.attr.src), ctx.attr.importpath)
    cmds = ["bash", "-c", cmd]
    result = env_execute(ctx, cmds, environment={"GOPATH": ctx.path('')})
    if result.return_code:
      fail("failed to generate server go files for %s: %s" % (
          ctx.attr.importpath, result.stderr))

    cmd = "cd src; %s generate client -f %s -t %s" % (swagger, ctx.path(ctx.attr.src), ctx.attr.importpath)
    cmds = ["bash", "-c", cmd]
    result = env_execute(ctx, cmds, environment={"GOPATH": ctx.path('')})
    if result.return_code:
      fail("failed to generate client go files for %s: %s" % (
          ctx.attr.importpath, result.stderr))

    cmds = ["mv", fake_repo + "/models", "models"]
    result = env_execute(ctx, cmds)
    if result.return_code:
        fail("failed to move go generated models %s: %s" % (
          fake_repo, result.stderr))

    cmds = ["mv", fake_repo + "/restapi", "restapi"]
    result = env_execute(ctx, cmds)
    if result.return_code:
        fail("failed to move go generated restapi %s: %s" % (
          fake_repo, result.stderr))

    cmds = ["mv", fake_repo + "/client", "client"]
    result = env_execute(ctx, cmds)
    if result.return_code:
        fail("failed to move go generated client %s: %s" % (
          fake_repo, result.stderr))

    cmds = ["rm", "-r", "src"]
    result = env_execute(ctx, cmds)
    if result.return_code:
        fail("failed to remove directories %s: %s" % (
          fake_repo, result.stderr))

    gazelle = ctx.path(ctx.attr._gazelle)
    cmds = [gazelle, '--go_prefix', ctx.attr.importpath, '--mode', 'fix', "--go_naming_convention", "import_alias",
            '--repo_root', ctx.path('')]
    cmds += [ctx.path('')]
    result = env_execute(ctx, cmds)
    if result.return_code:
      fail("failed to generate BUILD files for %s: %s" % (
          ctx.attr.importpath, result.stderr))

go_swagger_repository = repository_rule(
    implementation = _go_swagger_repository_impl,
    attrs = {
        "importpath": attr.string(mandatory = True),
        "src": attr.label(
            allow_files = [".json"],
        ),
        "_swagger": attr.label(
            default = Label("@com_github_tnarg_rules_go_swagger_repository_tools//:bin/swagger"),
            allow_single_file = True,
            executable = True,
            cfg = "host",   
        ),
        "_gazelle": attr.label(
            default = Label("@bazel_gazelle_go_repository_tools//:bin/gazelle"),
            allow_single_file = True,
            executable = True,
            cfg = "host",
        ),
    },
)

def env_execute(ctx, arguments, environment = None, **kwargs):
  """env_execute prepends "env -i" to "arguments" before passing it to
  ctx.execute.
  Variables that aren't explicitly mentioned in "environment"
  are removed from the environment. This should be preferred to "ctx.execute"
  in most situations.
  """
  env_args = ["env", "-i"]
  if environment:
    for k, v in environment.items():
      env_args += ["%s=%s" % (k, v)]
  return ctx.execute(env_args + arguments, **kwargs)
