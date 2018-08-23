#! /bin/sh

BUNDLE_GEMFILE=Gemfile.mutant bundle exec mutant --include lib --require eve_online --use rspec EveOnline*

