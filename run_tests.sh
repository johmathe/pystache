#!/usr/bin/env bash
set -e 

virtualenv .virtualenv
source .virtualenv/bin/activate

PYTHONPATH=. python -m pystache.commands.test
