#! /bin/sh

bundle exec mutant --include lib --require eve_online --use rspec EveOnline*

