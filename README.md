# aptwrapper

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

### Clases

#### Public Classes

* [`aptwrapper`](#class-aptwrapper)

#### Class: `apt`

Main class and only classs.

#### Parameters (all optional)

* `sources`: Creates new `apt::source` resources. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresources). Default: {}.

* `sources_hiera_merge`: Enable to ensure that hiera_hash is used to merge `sources`.

* `keys`: Creates new `apt::source` rekeys. Valid options: a hash to be passed to the [`create_rekeys` function](https://docs.puppetlabs.com/references/latest/function.html#createrekeys). Default: {}.

* `keys_hiera_merge`: Enable to ensure that hiera_hash is used to merge `keys`.

* `ppas`: Creates new `apt::source` reppas. Valid options: a hash to be passed to the [`create_reppas` function](https://docs.puppetlabs.com/references/latest/function.html#createreppas). Default: {}.

* `ppas_hiera_merge`: Enable to ensure that hiera_hash is used to merge `ppas`.

* `pins`: Creates new `apt::source` repins. Valid options: a hash to be passed to the [`create_repins` function](https://docs.puppetlabs.com/references/latest/function.html#createrepins). Default: {}.

* `pins_hiera_merge`: Enable to ensure that hiera_hash is used to merge `pins`.

* `settings`: Creates new `apt::source` resettings. Valid options: a hash to be passed to the [`create_resettings` function](https://docs.puppetlabs.com/references/latest/function.html#createresettings). Default: {}.

* `settings_hiera_merge`: Enable to ensure that hiera_hash is used to merge `settings`.

## Limitations

See puppetlabs/puppetlabs-apt for limitations.

## Development

Pull requests welcome. Make sure that your commits are atomic and contains rspec tests.
