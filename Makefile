# Copyright (c) 2022 LG Electronics Inc.
# SPDX-License-Identifier: GPL-2.0
CROSS_COMPILE ?= arm-linux-gnueabihf-

CC  := gcc
CXX := g++

CXXFLAGS := -O2 -g -std=c++14 -funwind-tables
LDFLAGS  := -ldl

host:
	$(CXX) -fPIC -shared $(CXXFLAGS) -o libheaptrace.so libheaptrace.cc $(LDFLAGS)
	$(CXX) $(CXXFLAGS) -o heaptrace heaptrace.cc
	$(CXX) -o sample -funwind-tables sample.c

target:
	$(CROSS_COMPILE)$(CXX) -fPIC -shared $(CXXFLAGS) -o libheaptrace.so libheaptrace.cc $(LDFLAGS)
	$(CROSS_COMPILE)$(CXX) $(CXXFLAGS) -o heaptrace heaptrace.cc
	$(CROSS_COMPILE)$(CXX) -o sample -funwind-tables sample.c

clean:
	rm -f heaptrace libheaptrace.so sample
