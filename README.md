# aptwrapper

[![Build Status](https://api.travis-ci.org/anders-larsson/puppet-aptwrapper.png)](https://travis-ci.org/anders-larsson/puppet-aptwrapper)

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with aptwrapper](#setup)
    * [Beginning with aptwrapper](#beginning-with-aptwrapper)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module adds hiera_merge support to several parameters in puppetlabs-apt.

## Setup

### Beginning with aptwrapper

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most
basic use of the module.

## Usage

See Usage of puppetlabs/puppetlabs-apt.
To hiera_hash to merge for sources use:

```puppet
apt::sources_hiera_merge: true
```

## Reference

### Classes

#### Public Classes

* [`aptwrapper`](#class-aptwrapper)

#### Class: `aptwrapper`

Main class and only classs.

#### Parameters (all optional)

* `sources`: Creates new `apt::source` resources. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresources). Default: {}.

* `sources_hiera_merge`: Enable to ensure that hiera_hash is used to merge `sources`. Valid options: bool (true|false) or string (true|false). Default: false.

* `keys`: Creates new `apt::key` keys. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createrekeys). Default: {}.

* `keys_hiera_merge`: Enable to ensure that hiera_hash is used to merge `keys`. Valid options: bool (true|false) or string (true|false). Default: false.

* `ppas`: Creates new `apt::ppa` ppas. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createreppas). Default: {}.

* `ppas_hiera_merge`: Enable to ensure that hiera_hash is used to merge `ppas`. Valid options: bool (true|false) or string (true|false). Default: false.

* `pins`: Creates new `apt::pin` pins. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createrepins). Default: {}.

* `pins_hiera_merge`: Enable to ensure that hiera_hash is used to merge `pins`. Valid options: bool (true|false) or string (true|false). Default: false

* `settings`: Creates new `apt::setting` settings. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresettings). Default: {}.

* `settings_hiera_merge`: Enable to ensure that hiera_hash is used to merge `settings`. Valid options: bool (true|false) or string (true|false). Default: false.

## Limitations

See puppetlabs/puppetlabs-apt for limitations.

## Development

Pull requests welcome. Make sure that your commits are atomic and contains rspec tests.
