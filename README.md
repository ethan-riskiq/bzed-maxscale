# maxscale

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with maxscale](#setup)
    * [What maxscale affects](#what-maxscale-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

MariaDB MaxScale is an open-source, database-centric proxy that works with
MariaDB Enterprise, MariaDB 5.5, MariaDB 10 and Oracle MySQL®. It has a
pluggable architecture designed to increase flexibility and aid customization
as well as a lightweight, high-speed networking core designed to facilitate
throughput.

## Module Description

This module will install MaxScale. More might be implemented later,
but for now setting up apt repositories and installing the package on
Debian/Ubuntu are the only supported features.

  ** FIXME **

## Setup

### What maxscale affects

* On Debian based systems this module will add a new apt key and sources list
  using the puppetlabs-apt module. In case you are using a different way to
  manage apt please ensure that your module won't conflict with
  puppetlabs-apt.

### Setup Requirements

For $::osfamily == 'Debian' the puppetlabs-apt module is required.

## Usage

  ** FIXME **

## Reference

  ** FIXME **

## Limitations

So far this module only works on Debian based systems.

## Development

Please fork on github and send pull requests!
