# Secrets

[![Build Status](https://travis-ci.org/faustinoaq/secrets.svg?branch=master)](https://travis-ci.org/faustinoaq/secrets)

Crystal shard to get secrets with hint and backspace support.

![Secrets](https://i.imgur.com/R52pscI.png "Secrets")

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  secrets:
    github: faustinoaq/secrets
```

## Usage

```crystal
require "secrets"

secret = Secrets.gets prompt: "Write your secret: "
puts "Your secret has #{secret.size} character(s)"
```

![secrets-example](https://i.imgur.com/i6XzYPn.gif "Getting secrets...")

```crystal
require "secrets"

secret = Secrets.gets prompt: "Write your secret: ", hint: "*", empty_error: "Empty input, Try again!"
puts "Your secret has #{secret.size} character(s)"
```

![secrets-example-error](https://i.imgur.com/ZLriiBx.gif "No empty secrets!")

```crystal
require "secrets"

secret = Secrets.gets prompt: "Write your secret: ", empty_error: "Retry!", retry: 3
if secret.empty?
  puts "Oh, no!, your secret is empty!"
else
  puts "Your secret has #{secret.size} character(s)"
end
```

![secrets-example-error-retry](https://i.imgur.com/FL0vxBJ.gif)

## Development

Execute `spec/` using:

```
crystal spec
Finished in 564.18 milliseconds
8 examples, 0 failures, 0 errors, 0 pending
```

## Contributing

1. Fork it ( https://github.com/faustinoaq/secrets/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [faustinoaq](https://github.com/faustinoaq) Faustino Aguilar - creator, maintainer
