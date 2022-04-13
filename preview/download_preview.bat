rem Download last version of original file
rem TOML
mkdir toml\logos
wget --output-document=toml/toml.md https://raw.githubusercontent.com/toml-lang/toml.io/main/specs/en/v1.0.0.md
wget --output-document=toml/logos/toml-200.png https://raw.githubusercontent.com/toml-lang/toml/main/logos/toml-200.png

rem YAML
wget --output-document=yaml/yaml.md https://raw.githubusercontent.com/yaml/yaml-spec/main/spec/1.2/markdown/spec.md
