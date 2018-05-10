# erb-hiera

## About

Generate documents from a scope, ERB template(s) and Hiera Data

## Install

```
gem install erb-hiera
```

## Usage

```
$ ./bin/erb-hiera --help
Options:
  -m, --mapping-config=<s>    specify mapping config file
  -c, --hiera-config=<s>      specify hiera config file
                               
  -i, --input=<s>             override input config options
  -o, --output=<s>            override output config options
                               
  -s, --scope=<s>             specify the scope
  -e, --environment=<s>       specify the environment
                               
  -d, --dry-run               don't write out files
                               
  -v, --verbose               print compiled templates
  -b, --debug                 print backtrace on error
                               
  -h, --help                  Show this message
```

## Example

```
cd example
erb-hiera --mapping-config mapping.yaml --hiera-config hiera.yaml --verbose

# render a specific template using injected erb scope (outputs only to stdout)
erb-hiera --input templates/template.txt --hiera-config hiera.yaml --scope '{ "environment": "prod" }' -o -
```

## References

* [erb](http://www.stuartellis.name/articles/erb/#writing-templates)
* [hiera](https://docs.puppet.com/hiera/)
