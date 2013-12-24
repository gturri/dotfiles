#!/usr/bin/ruby

require 'fileutils'
require_relative 'scripts/printer'
require_relative 'scripts/installer'

Installer.new.install
