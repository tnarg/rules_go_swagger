load("@bazel_gazelle//:deps.bzl", "go_repository")

def go_swagger_deps():
    go_repository(
        name = "com_github_go_openapi_analysis",
        commit = "0473cb67199f68b8b7d90e641afd9e79ad36b851",
        importpath = "github.com/go-openapi/analysis",
    )
    go_repository(
        name = "com_github_go_openapi_errors",
        commit = "03cfca65330da08a5a440053faf994a3c682b5bf",
        importpath = "github.com/go-openapi/errors",
    )

    go_repository(
        name = "com_github_go_openapi_jsonpointer",
        commit = "779f45308c19820f1a69e9a4cd965f496e0da10f",
        importpath = "github.com/go-openapi/jsonpointer",
    )

    go_repository(
        name = "com_github_go_openapi_jsonreference",
        commit = "36d33bfe519efae5632669801b180bf1a245da3b",
        importpath = "github.com/go-openapi/jsonreference",
    )

    go_repository(
        name = "com_github_go_openapi_loads",
        commit = "a80dea3052f00e5f032e860dd7355cd0cc67e24d",
        importpath = "github.com/go-openapi/loads",
    )

    go_repository(
        name = "com_github_go_openapi_runtime",
        commit = "2e9e988df6c290425033bacd425e008950c96be6",
        importpath = "github.com/go-openapi/runtime",
    )

    go_repository(
        name = "com_github_go_openapi_spec",
        commit = "e51c28f07047ad90caff03f6450908720d337e0c",
        importpath = "github.com/go-openapi/spec",
    )

    go_repository(
        name = "com_github_go_openapi_strfmt",
        commit = "93a31ef21ac23f317792fff78f9539219dd74619",
        importpath = "github.com/go-openapi/strfmt",
    )

    go_repository(
        name = "com_github_go_openapi_swag",
        commit = "e43299b4afa7bc7f22e5e82e3d48607230e4c177",
        importpath = "github.com/go-openapi/swag",
    )

    go_repository(
        name = "com_github_go_openapi_validate",
        commit = "035dcd74f1f61e83debe1c22950dc53556e7e4b2",
        importpath = "github.com/go-openapi/validate",
    )

    go_repository(
        name = "in_gopkg_mgo_v2",
        commit = "3f83fa5005286a7fe593b055f0d7771a7dce4655",
        importpath = "gopkg.in/mgo.v2",
    )

    go_repository(
        name = "com_github_mailru_easyjson",
        commit = "dffba8d13bbd998df17d8557570cdea0624b9d1d",
        importpath = "github.com/mailru/easyjson",
    )

    go_repository(
        name = "in_gopkg_yaml_v2",
        commit = "cd8b52f8269e0feb286dfeef29f8fe4d5b397e0b",
        importpath = "gopkg.in/yaml.v2",
    )

    go_repository(
        name = "com_github_asaskevich_govalidator",
        commit = "948702997351133e1cc5a1b5842313ca46deeb0d",
        importpath = "github.com/asaskevich/govalidator",
    )

    go_repository(
        name = "com_github_mitchellh_mapstructure",
        commit = "d0303fe809921458f417bcf828397a65db30a7e4",
        importpath = "github.com/mitchellh/mapstructure",
    )

    go_repository(
        name = "org_golang_x_net",
        commit = "5961165da77ad3a2abf3a77ea904c13a76b0b073",
        importpath = "golang.org/x/net",
    )

    go_repository(
        name = "org_golang_x_text",
        commit = "19e51611da83d6be54ddafce4a4af510cb3e9ea4",
        importpath = "golang.org/x/text",
    )

    go_repository(
        name = "com_github_PuerkitoBio_purell",
        commit = "b938d81255b5473c57635324295cb0fe398c7a58",
        importpath = "github.com/PuerkitoBio/purell",
    )

    go_repository(
        name = "com_github_PuerkitoBio_urlesc",
        commit = "bbf7a2afc14f93e1e0a5c06df524fbd75e5031e5",
        importpath = "github.com/PuerkitoBio/urlesc",
    )
